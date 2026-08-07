-- nulls and duplicates 

SELECT 
cst_id, 
count(*) AS num_orders
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING count(*) > 1 OR cst_id IS NULL


-- unwanted spaces 

SELECT 
cst_firstname,
cst_lastname
from silver.crm_cust_info
WHERE cst_firstname != (TRIM(cst_firstname)) 
     OR cst_lastname != (TRIM(cst_lastname))


