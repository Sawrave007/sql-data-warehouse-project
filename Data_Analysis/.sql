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

