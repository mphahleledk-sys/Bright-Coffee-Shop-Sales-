select * from bright_coffee_project.default.bright_coffee_shop_analysis_case_study_1 LIMIT 1000 ;

---Query calculate total sales (698812.329999)

select sum(transaction_qty*unit_price) AS Total_sales
from  bright_coffee_project.default.bright_coffee_shop_analysis_case_study_1 ;


--Query  finding min & max on price (0.8 & 45)

select MIN(unit_price) AS Lowest_price,
       MAX(unit_price) AS  Highest_price 
from  bright_coffee_project.default.bright_coffee_shop_analysis_case_study_1 ;

 
--Query checking start date & last date data collection (Min-2023-01-01 to Max-2023-06-30)
-- data duration 6months
select min(transaction_date) AS min_date,
       max(transaction_date) AS max_date
      FROM bright_coffee_project.default.bright_coffee_shop_analysis_case_study_1 ;

--Query checking different stores (Astoria ,Hells Kitchen & Lower Manhattan)

select distinct store_location
FROM bright_coffee_project.default.bright_coffee_shop_analysis_case_study_1 ;

---- Query checking numer of stores  (they are 3 stores)

select count (distinct store_location) as store_number
FROM bright_coffee_project.default.bright_coffee_shop_analysis_case_study_1;

---- Query checking how many prod catergory  (they are 9 )
select distinct product_category
FROM bright_coffee_project.default.bright_coffee_shop_analysis_case_study_1;

---- Query checking how many product details  (they are 80)
select distinct product_detail
FROM bright_coffee_project.default.bright_coffee_shop_analysis_case_study_1;

---- Query checking product catergory & product detail

select distinct product_detail as Detail,
            product_category as Category
FROM bright_coffee_project.default.bright_coffee_shop_analysis_case_study_1;

---- Query checking how many product type 
select distinct product_type
FROM bright_coffee_project.default.bright_coffee_shop_analysis_case_study_1;

---Query number of rows & columns 

select COUNT(*) as number_of_rows,
count (distinct transaction_id) as number_of_sales
FROM  bright_coffee_project.default.bright_coffee_shop_analysis_case_study_1;

--Query count # of rows ,# of sales ,# of products and stores =149116,149116 ,80 & 3

select COUNT(*) as number_of_rows,
count(distinct transaction_id) as number_of_sales,
count(distinct product_id) as number_products,
count(distinct store_id) as number_stores
FROM bright_coffee_project.default.bright_coffee_shop_analysis_case_study_1;

SELECT transaction_id,
      transaction_date,
      Dayname(transaction_date) AS Day_name,
      Monthname(transaction_date) AS Month_name,
      transaction_qty*unit_price AS revenue_per_transaction
FROM bright_coffee_project.default.bright_coffee_shop_analysis_case_study_1;

---Query count number of rows 

SELECT COUNT(*)
FROM bright_coffee_project.default.bright_coffee_shop_analysis_case_study_1;

select 
transaction_id,
transaction_date,
transaction_time,
transaction_qty,
store_id,
store_location,
product_id,
unit_price,
product_category,
product_type,
product_detail,

--Adding column to enhance table for better insights 
dayname(transaction_date) AS Day_name,
-- new column added 1
--Adding column to enhance table for better insights 
-- new column added 2
monthname(transaction_date) AS month_name,
-- new column added 3
dayofmonth(transaction_date) AS date_of_month,
-- new column added 4 - dertemining weekday and weekend

CASE
WHEN 
dayname(transaction_date) IN ('Sun','Sat') THEN 'weekend'
ELSE 'Weekday'
END AS day_classification,
-- new column added 5-time buckets

CASE
WHEN date_format(transaction_time, 'HH:mm:ss') between '05:00:00' AND '08:59:59' THEN '01.Rush Hour'
WHEN date_format(transaction_time, 'HH:mm:ss') between '09:00:00' AND '11:59:59' THEN '02.Mid morning'
WHEN date_format(transaction_time, 'HH:mm:ss') between '12:00:00' AND '15:59:59' THEN '03.Afternoon'
WHEN date_format(transaction_time, 'HH:mm:ss') between '16:00:00' AND '18:59:59' THEN '04.Rush Hour'
ELSE '05.Night'
END AS Time_classification, 
-- new column added 6 - spend buckets

CASE
WHEN (transaction_qty*unit_price)<=50 THEN '01.Low spender'
WHEN (transaction_qty*unit_price) BETWEEN 51 AND 200 THEN '02.Medium Spender'
WHEN (transaction_qty*unit_price) BETWEEN 201 AND 300 THEN '03.Moreki'
ELSE '04.Blesser'
END AS Spend_bucket,
-- new column added 7 - revenue

transaction_qty*unit_price AS Revenue 
FROM bright_coffee_project.default.bright_coffee_shop_analysis_case_study_1 ;



