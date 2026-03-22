--Bright Coffee Sales Project Scripts (SQL)

--Query exploring each column
select * from `bright_coffee_project`.`default`.`bright_coffee_shop_analysis_case_study_1` limit;

-- Query calculate total sales 

select sum(transaction_qty*unit_price) AS Total_sales
from  `workspace`.`default`.`bright_coffee_shop_sales` ;

--Query finding min & max on unit price (0.8 & 45)

select MIN(unit_price) AS Lowest_price,
       MAX(unit_price) AS  Highest_price 
FROM `bright_coffee_project`.`default`.`bright_coffee_shop_analysis_case_study_1`;

--Query checking start date & last date data collection (Min-2023-01-01 to Max-2023-06-30)
-- data duration 6months
select min(transaction_date) AS min_date,
       max(transaction_date) AS max_date
      FROM `workspace`.`default`.`bright_coffee_shop_sales`;

-- Query checking different stores (Astoria ,Hells Kitchen & Lower Manhattan)
select distinct store_location
FROM `workspace`.`default`.`bright_coffee_shop_sales`;

---- Query checking number of stores (they are 3 stores)
select count (distinct store_location) as store_number
FROM `workspace`.`default`.`bright_coffee_shop_sales`;

---- Query checking how many prod catergory (they are 9)
select distinct product_category
FROM `workspace`.`default`.`bright_coffee_shop_sales`;

---- Query checking how many product details (they are 80)
select distinct product_detail
FROM `workspace`.`default`.`bright_coffee_shop_sales`;

---- Query checking product catergory & product detail
select distinct product_detail as Detail,
product_category as Category
FROM `workspace`.`default`.`bright_coffee_shop_sales`;

---- Query checking how many product type 
select distinct product_type
FROM `workspace`.`default`.`bright_coffee_shop_sales`;

select COUNT(*) as number_of_rows,
count (distinct transaction_id) as number_of_sales
FROM `workspace`.`default`.`bright_coffee_shop_sales`;

-- Query count # of rows ,# of sales ,# of products and stores =149116,149116 ,80 & 3

select COUNT(*) as number_of_rows,
count(distinct transaction_id) as number_of_sales,
count(distinct product_id) as number_products,
count(distinct store_id) as number_stores
FROM `workspace`.`default`.`bright_coffee_shop_sales`;

