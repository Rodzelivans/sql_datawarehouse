CREATE OR REPLACE PROCEDURE "Bronze".load_bronze()
language plpgsql AS $$
DECLARE 
	start_time TIMESTAMP;
	batch_time TIMESTAMP;
BEGIN
	BEGIN
	batch_time := clock_timestamp();
	RAISE NOTICE '===========================';
	RAISE NOTICE 'WORKING ON CRM_TABLES';
	RAISE NOTICE '===========================';

	start_time := clock_timestamp();
	
	RAISE NOTICE 'TRUNCATING crm_cust_info';
	TRUNCATE TABLE "Bronze".crm_cust_info;
	RAISE NOTICE 'INSERTING DATA INTO: crm_cust_info';
	COPY "Bronze".crm_cust_info
	FROM 'D:\project_data\source_crm\cust_info.csv'
	WITH(
	FORMAT CSV, HEADER true
	);

	RAISE NOTICE 'LOAD DURATION: %', clock_timestamp() - start_time;

	start_time := clock_timestamp();
	
	RAISE NOTICE 'TRUNCATING crm_prd_info';
	TRUNCATE TABLE "Bronze".crm_prd_info;
	RAISE NOTICE 'INSERTING DATA INTO: crm_prd_info';
	COPY "Bronze".crm_prd_info
	FROM 'D:\project_data\source_crm\prd_info.csv'
	WITH(
	FORMAT CSV, HEADER true
	);

	RAISE NOTICE 'LOAD DURATION: %', clock_timestamp() - start_time;

	start_time := clock_timestamp();
	
	RAISE NOTICE 'TRUNCATING crm_sls_dt';
	TRUNCATE TABLE "Bronze".crm_sls_dt;
	RAISE NOTICE 'INSERTING DATA INTO: crm_sls_dt';
	COPY "Bronze".crm_sls_dt
	FROM 'D:\project_data\source_crm\sales_details.csv'
	WITH(
	FORMAT CSV, HEADER true
	);
	RAISE NOTICE 'LOAD DURATION: %', clock_timestamp() - start_time;
	
	RAISE NOTICE '===========================';
	RAISE NOTICE 'WORKING ON ERP_TABLES';
	RAISE NOTICE '===========================';

	start_time := clock_timestamp();
	
	RAISE NOTICE 'TRUNCATING erp_cust_az';
	TRUNCATE TABLE "Bronze".erp_cust_az;
	RAISE NOTICE 'INSERTING DATA INTO: erp_cust_az';
	COPY "Bronze".erp_cust_az
	FROM 'D:\project_data\source_erp\CUST_AZ12.csv'
	WITH(
	FORMAT CSV, HEADER true
	);
	RAISE NOTICE 'LOAD DURATION: %', clock_timestamp() - start_time;

	start_time := clock_timestamp();
	
	RAISE NOTICE 'TRUNCATING erp_loc';
	TRUNCATE TABLE "Bronze".erp_loc;
	RAISE NOTICE 'INSERTING DATA INTO: erp_loc';
	COPY "Bronze".erp_loc
	FROM 'D:\project_data\source_erp\LOC_A101.csv'
	WITH(
	FORMAT CSV, HEADER true
	);
	RAISE NOTICE 'LOAD DURATION: %', clock_timestamp() - start_time;
	
	start_time := clock_timestamp();
	
	RAISE NOTICE 'TRUNCATING erp_px_cat';
	TRUNCATE TABLE "Bronze".erp_px_cat;
	RAISE NOTICE 'INSERTING DATA INTO: erp_px_cat';
	COPY "Bronze".erp_px_cat
	FROM 'D:\project_data\source_erp\PX_CAT_G1V2.csv'
	WITH(
	FORMAT CSV, HEADER true
	);
	RAISE NOTICE 'LOAD DURATION: %', clock_timestamp() - start_time;
	RAISE NOTICE '================================================.';
	RAISE NOTICE 'Bronze layer successfully loaded.';
	RAISE NOTICE '================================================.';
	RAISE NOTICE 'BATCH DURATION: %', clock_timestamp() - batch_time;
	
	EXCEPTION
		WHEN OTHERS THEN
		RAISE NOTICE 'SOMETHING WENT WRONG:%', SQLERRM;
		RAISE NOTICE 'CODE OF ERROR:%', SQLSTATE;
		RAISE;
	END;
END;
$$;
