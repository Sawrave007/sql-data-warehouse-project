-- nulls and duplicates 

SELECT 
cst_id, 
count(*) AS num_orders
FROM bronze.crm_cust_info
GROUP BY cst_id
HAVING count(*) > 1 OR cst_id IS NULL


-- unwanted spaces 

SELECT 
cst_firstname,
cst_lastname
from bronze.crm_cust_info
WHERE cst_firstname != (TRIM(cst_firstname)) 
     OR cst_lastname != (TRIM(cst_lastname))



SELECT 
prd_cost,
prd_nm
from bronze.crm_prd_info
where prd_nm != (TRIM(prd_nm)) OR
      prd_cost is NULL or prd_cost < 0


SELECT DISTINCT
prd_line
from bronze.crm_prd_info

-- check for invalid dates
SELECT 
*
FROM bronze.crm_prd_info
WHERE prd_end_dt < prd_start_dt


-- SALES = QUANTITY *  PRICE 

SELECT
sls_sales,
sls_quantity, 
sls_price
FROM bronze.crm_sales_details
WHERE sls_sales != (sls_quantity * sls_price) OR
      sls_quantity < 0 OR
      sls_price < 0 OR 
      sls_sales < 0 OR 
      sls_sales IS NULL OR
      sls_quantity IS NULL OR
     sls_price IS NULL
ORDER BY sls_sales, sls_quantity, sls_price