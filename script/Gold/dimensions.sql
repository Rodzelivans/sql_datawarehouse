CREATE VIEW gold.dim_customers AS 	
SELECT 
	ROW_NUMBER() OVER (ORDER BY ci.cst_id) AS customer_key,
	ci.cst_id AS customer_id,
	ci.cst_key AS customer_number,
	ci.cst_first_name AS first_name,
	ci.cst_last_name AS last_name,
	loc.cntry AS country,
	CASE WHEN ci.cst_gndr != 'n/a' THEN ci.cst_gndr
	ELSE COALESCE(ca.gen, 'n/a')
	END AS gender,
	ca.bdate AS birthdate,
	ci.cst_material_status AS marital_status,
	ci.cst_create_date AS create_date
FROM silver.crm_cust_info ci
INNER JOIN silver.erp_cust_az ca
ON ci.cst_key = ca.cid
INNER JOIN silver.erp_loc loc
ON ci.cst_key = loc.cid

