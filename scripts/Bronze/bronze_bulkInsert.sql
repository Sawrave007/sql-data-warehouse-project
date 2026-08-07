/* 
===============================

    CREATED BRONZE LAYER TABLES AND LOADING DATA FROM SOURCE FILES WITH BULK INSERT 
    AND STORED PROCEDURE bronze.load_bronze

===============================

This script creates the bronze layer tables in the bronze schema
and loads data from source files using BULK INSERT.

if they already exist, the script will recreate the tables
and load the data again and will get new data in batch system.

*/


CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    DECLARE @startTime DATETIME, @endTime DATETIME, @batch_startTime DATETIME, @batch_endTime DATETIME;

    BEGIN TRY
    SET @batch_startTime = GETDATE();
    PRINT '===============================';
    PRINT 'Loading bronze layer...';
    PRINT '===============================';

    PRINT '-------------------------------';
    PRINT 'LOADING CRM TABLES';
    PRINT '-------------------------------';

    SET @startTime = GETDATE();
    PRINT 'TRANCATING bronze.crm_cust_info';
    TRUNCATE TABLE bronze.crm_cust_info;

    PRINT 'LOADING bronze.crm_cust_info';
    BULK INSERT bronze.crm_cust_info
    FROM 'E:\Projects\SQL\Warehouse Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK

    );
    SET @endtime = GETDATE();
    PRINT 'Time taken to load bronze.crm_cust_info: ' + CAST(DATEDIFF(SECOND, @startTime, @endTime) AS NVARCHAR(10)) + ' seconds';
    PRINT '-------------------------------';
    
    SET @startTime = GETDATE();
    PRINT 'TRANCATING bronze.crm_prd_info';
    TRUNCATE TABLE bronze.crm_prd_info;
    PRINT 'LOADING bronze.crm_prd_info';
    BULK INSERT bronze.crm_prd_info
    FROM 'E:\Projects\SQL\Warehouse Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK

    );
    SET @endtime = GETDATE();
    PRINT 'Time taken to load bronze.crm_prd_info: ' + CAST(DATEDIFF(SECOND, @startTime, @endTime) AS NVARCHAR(10)) + ' seconds';
    PRINT '-------------------------------';    

    SET @startTime = GETDATE();
    PRINT 'TRANCATING bronze.crm_sales_details';
    TRUNCATE TABLE bronze.crm_sales_details;
    PRINT 'LOADING bronze.crm_sales_details';
    BULK INSERT bronze.crm_sales_details
    FROM 'E:\Projects\SQL\Warehouse Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK

    );
    SET @endtime = GETDATE();
    PRINT 'Time taken to load bronze.crm_sales_details: ' + CAST(DATEDIFF(SECOND, @startTime, @endTime) AS NVARCHAR(10)) + ' seconds';          
    print '-------------------------------';


    PRINT '-------------------------------';
    PRINT 'LOADING ERP TABLES';
    PRINT '-------------------------------';

    SET @startTime = GETDATE();
    PRINT 'TRANCATING bronze.erp_cust_az12';
    TRUNCATE TABLE bronze.erp_cust_az12;
    PRINT 'LOADING bronze.erp_cust_az12';

    BULK INSERT bronze.erp_cust_az12
    FROM 'E:\Projects\SQL\Warehouse Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK

    );
    SET @endtime = GETDATE();
    PRINT 'Time taken to load bronze.erp_cust_az12: ' + CAST(DATEDIFF(SECOND, @startTime, @endTime) AS NVARCHAR(10)) + ' seconds';
    PRINT '-------------------------------';    

    SET @startTime = GETDATE();
    PRINT 'TRANCATING bronze.erp_cust_a101';
    TRUNCATE TABLE bronze.erp_loc_a101;
    PRINT 'LOADING bronze.erp_loc_a101';
    BULK INSERT bronze.erp_loc_a101
    FROM "E:\Projects\SQL\Warehouse Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv"
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK

    );
    SET @endtime = GETDATE();
    PRINT 'Time taken to load bronze.erp_loc_a101: ' + CAST(DATEDIFF(SECOND, @startTime, @endTime) AS NVARCHAR(10)) + ' seconds';
    PRINT '-------------------------------';    


    SET @startTime = GETDATE();
    PRINT 'TRANCATING bronze.erp_px_cat_g1v2';
    TRUNCATE TABLE bronze.erp_px_cat_g1v2;
    PRINT 'LOADING bronze.erp_px_cat_g1v2';
    BULK INSERT bronze.erp_px_cat_g1v2
    FROM "E:\Projects\SQL\Warehouse Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv"
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK

    );
    SET @endtime = GETDATE();
    PRINT 'Time taken to load bronze.erp_px_cat_g1v2: ' + CAST(DATEDIFF(SECOND, @startTime, @endTime) AS NVARCHAR(10)) + ' seconds';
    PRINT '-------------------------------';    
    SET @batch_endTime = GETDATE();
    PRINT 'Total time taken to load bronze layer: ' + CAST(DATEDIFF(SECOND, @batch_startTime, @batch_endTime) AS NVARCHAR(10)) + ' seconds';
    END TRY 
    BEGIN CATCH 
        PRINT '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!';
        PRINT 'Error loading bronze layer: ' + ERROR_MESSAGE();
        PRINT 'Error number: ' + CAST(ERROR_NUMBER() AS NVARCHAR(10));
        PRINT 'Error state: ' + CAST(ERROR_STATE() AS NVARCHAR(10));
    END CATCH

END

