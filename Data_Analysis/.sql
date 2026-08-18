SELECT * from INFORMATION_SCHEMA.tables

SELECT DISTINCT category, subcategory, product_name from gold.dim_products
ORDER BY 1,2,3


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




