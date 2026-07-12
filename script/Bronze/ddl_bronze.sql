CREATE DATABASE data_warehouse;
CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;

CREATE TABLE "Bronze".crm_cust_info(
cst_id INT,
cst_key VARCHAR(50),
cst_first_name VARCHAR(50),
cst_last_name VARCHAR(50),
cst_material_status VARCHAR(50),
cst_gndr VARCHAR(50),
cst_create_date DATE
);
CREATE TABLE "Bronze".crm_prd_info(
prd_id INT,
prd_key VARCHAR(50),
prd_nm VARCHAR,
prd_cost INT,
prd_line VARCHAR(50),
prd_start_dt DATE,
prd_end_dt DATE
);
CREATE TABLE "Bronze".crm_sls_dt(
sls_ord_num VARCHAR(50),
sls_prd_key VARCHAR(50),
sls_cust_id INT,
sls_order_dt INT,
sls_ship_dt INT,
sls_due_dt INT,
sls_sales INT,
sls_quantity INT,
sls_price INT
);
CREATE TABLE "Bronze".erp_cust_az(
CID VARCHAR(50),
BDATE DATE,
GEN VARCHAR(50)
);
CREATE TABLE "Bronze".erp_px_cat(
PX_ID VARCHAR(50),
CAT VARCHAR(50),
SUBCAT VARCHAR(50),
MAINTENANCE VARCHAR(50)
);
CREATE TABLE "Bronze".erp_loc(
CID VARCHAR(50),
CNTRY VARCHAR(50)
);
