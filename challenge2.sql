#Step 1: create a new database schema named 'mosafer'
CREATE DATABASE mosafer;

#Step 2: switch to 'mosafer' database
USE mosafer;

#Step 3: create L1(source table)
CREATE TABLE L1 (
order_type TEXT,
product_type TEXT,
dim_group_id TEXT,
order_no TEXT,
dim_bookingdate_id TEXT,
dim_store_id TEXT,
ahs_group_name TEXT,
product_name TEXT,
product_code TEXT,
dim_customer_id TEXT,
dim_language TEXT,
dim_totals_currency TEXT,
dim_status_id TEXT,
phone TEXT,
payment_amount DOUBLE,
discount_amount DOUBLE,
base_amount DOUBLE,
inputvat DOUBLE,
outputvat DOUBLE,
product_vat DOUBLE,
selling_price DOUBLE,
selling_price_vat DOUBLE,
conversion_rate_sar DOUBLE,
conversion_rate_usd DOUBLE,
ibv DOUBLE NULL, 
gbv DOUBLE NULL); #ibv & gbv accept null becasue there are empty values in rows (102 -108) in the excel table

#Step 4: create L2(the transformed table)
CREATE TABLE L2 (
order_type TEXT,
product_type TEXT,
dim_group_id TEXT,
order_no TEXT,
dim_bookingdate_id TEXT,
dim_store_id TEXT,
service_fee_code TEXT,
product_code TEXT,
dim_customer_id TEXT,
dim_language TEXT,
dim_totals_currency TEXT,
dim_status_id TEXT,
phone TEXT,
payment_amount DOUBLE,
discount_amount DOUBLE,
service_fee_amount DOUBLE,
base_amount DOUBLE, 
inputvat DOUBLE,
outputvat DOUBLE,
product_vat DOUBLE,
selling_price DOUBLE,
selling_price_vat DOUBLE,
ibv DOUBLE,
iov_usd DOUBLE,
gbv DOUBLE,
gbv_usd DOUBLE);

#Step 5: downlowd L1 & L2 tables as CSV file on local machine from the provided Link and save it in current DB folder.

#Step 6: import data from L1.CSV into the recently created SQL L1 table
LOAD DATA INFILE 'L1.csv'
INTO TABLE L1
FIELDS TERMINATED BY ','
IGNORE 1 LINES;

#Step 7: import data from L2.CSV into the recently created SQL L2 table
LOAD DATA INFILE 'L2.csv'
INTO TABLE L2
FIELDS TERMINATED BY ','
IGNORE 1 LINES;

####################################### Validation Queries on L2 ###################################################

#Query 1: Check if (iov_usd = ibv * conversion_rate_usd)
SELECT
    L2.phone,
    L1.ibv,
    L1.conversion_rate_usd,
    truncate(L1.ibv * L1.conversion_rate_usd, 2) AS expected_iov_usd,
    L2.iov_usd AS actual_iov_usd,
    CASE
        WHEN L2.iov_usd = truncate(L1.ibv * L1.conversion_rate_usd,2) THEN 'Correct'
        ELSE 'Incorrect'
    END AS result
FROM
    L2
JOIN
    L1 ON L2.phone = L1.phone AND L1.product_type = L1.order_type;



#Query 2:Check if (gbv_usd = gbv * conversion_rate_usd)
SELECT
    L2.phone,
    L1.gbv,
    L1.conversion_rate_usd,
    truncate(L1.gbv * L1.conversion_rate_usd, 2) AS expected_gbv_usd,
    L2.gbv_usd AS actual_gbv_usd,
    CASE
        WHEN L2.gbv_usd = truncate(L1.gbv * L1.conversion_rate_usd,2) THEN 'Correct'
        ELSE 'Incorrect'
    END AS result
FROM
    L2
JOIN
    L1 ON L2.phone = L1.phone AND L1.product_type = L1.order_type;
    
#Query 3:Check if service_fee_code in L2 equals to product_name in L1 When Product_type = 'rule'
SELECT
    L1.phone,
    L1.product_name,
    L1.product_type,
    L2.service_fee_code,
    CASE
        WHEN L2.service_fee_code = L1.product_name THEN 'Correct'
        ELSE 'Incorrect'
    END AS result
FROM
    L1
JOIN
    L2 ON L1.phone = L2.phone AND L1.product_type='rule';

#Query 4:Check if 'L2.base_amount == L1.base_amount' when "L1.product_type = L1.order_type"
SELECT
    L2.phone,
    L1.base_amount AS 'L1_base_amount',
    L2.base_amount AS 'L2_base_amount',
    CASE
        WHEN L2.base_amount = L1.base_amount THEN 'Correct'
        ELSE 'Incorrect'
    END AS result
FROM
    L1
JOIN
    L2 ON L1.phone = L2.phone AND L1.product_type = L1.order_type;
