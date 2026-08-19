SELECT * from INFORMATION_SCHEMA.tables

SELECT DISTINCT category, subcategory, product_name from gold.dim_products
ORDER BY 1,2,3;


 SELECT 'Total Sales' AS Measure_name, SUM(sales_amount) FROM gold.fact_sales 
UNION ALL 
SELECT 'Total Quantity' AS Measure_name, SUM(quantity) FROM gold.fact_sales 
UNION ALL
SELECT 'Average Price' AS Measure_name, AVG(price) FROM gold.fact_sales 
UNION ALL 
SELECT 'Total NUM of Orders' AS Measure_name, COUNT(DISTINCT order_number) FROM gold.fact_sales 
UNION ALL 
SELECT 'Total NUM of Products' AS Measure_name, COUNT(DISTINCT product_key) FROM gold.dim_products
UNION ALL 
SELECT 'Total NUM of Customers' AS Measure_name, COUNT(customer_key) FROM gold.dim_customers ;




SELECT 
YEAR(order_date) as sale_year,
MONTH(order_date) as sale_month,
sum(sales_amount) as sum_of_sales,
count(DISTINCT customer_key) as total_customers,
sum(quantity) as sold_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL 
GROUP BY YEAR(order_date), Month(order_date)
Order by YEAR(order_date), Month(order_date)



Select 
sale_year,
sale_month,
total_sales,
sum(total_sales) OVER(ORDER BY sale_year, sale_month) as running_total_sales
FROM (
    SELECT 
    YEAR(order_date) as sale_year,
    MONTH(order_date) as sale_month,
    sum(sales_amount) as total_sales,
    count(DISTINCT customer_key) as total_customers,
    sum(quantity) as sold_quantity
    FROM gold.fact_sales
    WHERE order_date IS NOT NULL 
    GROUP BY YEAR(order_date), Month(order_date)
)t

Select 
sale_year,
sale_month,
total_sales,
sum(total_sales) OVER(PARTITION BY sale_year ORDER BY sale_year, sale_month) as running_total_sales
FROM (
    SELECT 
    YEAR(order_date) as sale_year,
    MONTH(order_date) as sale_month,
    sum(sales_amount) as total_sales,
    count(DISTINCT customer_key) as total_customers,
    sum(quantity) as sold_quantity
    FROM gold.fact_sales
    WHERE order_date IS NOT NULL 
    GROUP BY YEAR(order_date), Month(order_date)
)t



/* Analyze the yearly performance of products by comparing their sales 
to both the average sales performance of the product and the previous year's sales */
WITH yearly_product_sales AS (
    SELECT
        YEAR(f.order_date) AS order_year,
        p.product_name,
        SUM(f.sales_amount) AS current_sales
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_products p
        ON f.product_key = p.product_key
    WHERE f.order_date IS NOT NULL
    GROUP BY 
        YEAR(f.order_date),
        p.product_name
)
SELECT
    order_year,
    product_name,
    current_sales,
    AVG(current_sales) OVER (PARTITION BY product_name) AS avg_sales,
    current_sales - AVG(current_sales) OVER (PARTITION BY product_name) AS diff_avg,
    CASE 
        WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name) > 0 THEN 'Above Avg'
        WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name) < 0 THEN 'Below Avg'
        ELSE 'Avg'
    END AS avg_change,
    -- Year-over-Year Analysis
    LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) AS last_year_sales,
    current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) AS diff_last_year_sales,
    CASE 
        WHEN current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) > 0 THEN 'Increase'
        WHEN current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) < 0 THEN 'Decrease'
        ELSE 'No Change'
    END AS metric
FROM yearly_product_sales
ORDER BY product_name, order_year;



/*Group customers into three segments based on their spending behavior:
	- VIP: Customers with at least 12 months of history and spending more than €5,000.
	- Regular: Customers with at least 12 months of history but spending €5,000 or less.
	- New: Customers with a lifespan less than 12 months.
And find the total number of customers by each group
*/
WITH customer_spending AS (
    SELECT
        c.customer_key,
        SUM(f.sales_amount) AS total_spending,
        MIN(order_date) AS first_order,
        MAX(order_date) AS last_order,
        DATEDIFF(month, MIN(order_date), MAX(order_date)) AS lifespan
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_customers c
        ON f.customer_key = c.customer_key
    GROUP BY c.customer_key
)
SELECT 
    customer_segment,
    COUNT(customer_key) AS total_customers
FROM (
    SELECT 
        customer_key,
        CASE 
            WHEN lifespan >= 12 AND total_spending > 5000 THEN 'VIP'
            WHEN lifespan >= 12 AND total_spending <= 5000 THEN 'Regular'
            ELSE 'New'
        END AS customer_segment
    FROM customer_spending
) AS segmented_customers
GROUP BY customer_segment
ORDER BY total_customers DESC;


-- Which categories contribute the most to overall sales?
WITH category_sales AS (
    SELECT
        p.category,
        SUM(f.sales_amount) AS total_sales
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_products p
        ON p.product_key = f.product_key
    GROUP BY p.category
)
SELECT
    category,
    total_sales,
    SUM(total_sales) OVER () AS overall_sales,
    ROUND((CAST(total_sales AS FLOAT) / SUM(total_sales) OVER ()) * 100, 2) AS percentage_of_total
FROM category_sales
ORDER BY total_sales DESC;
