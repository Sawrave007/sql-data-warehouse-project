-- nulls and duplicates 

SELECT 
cst_id, 
count(*) AS num_orders
FROM bronze.crm_cust_info
GROUP BY cust_id
HAVING count(*) > 1