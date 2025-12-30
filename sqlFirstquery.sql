use practicedb;
show databases;
use practicedb;
#total sales
select round(sum(sales),2) As total_sales
from superstore;
# Monthly sales trend
select
  month(`Order Date`) as month,
  round(sum(sales),2) as Monthly_sales
from superstore
group by month(`Order Date`) 
order by month;
#qury not excut properly date is text format change query
select `order date` from superstore limit 5;
SELECT 
  MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS month,
  ROUND(SUM(sales), 2) AS Monthly_sales
FROM superstore
GROUP BY MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y'))
ORDER BY month;
#Top 5 products by sales
select `Sub-category`,
round(sum(sales),2) as total_sales
from superstore
group by `Sub-category`
order by total_sales desc 
limit 5;
#Region wise sales
select max(sales) as max_sales
from superstore;
#Max sales by category
SELECT 
  Category,
  ROUND(SUM(Sales),2) AS total_sales
FROM superstore
GROUP BY Category
ORDER BY total_sales DESC
LIMIT 1;
# max sales by subcategory
SELECT 
  category,`sub-category`,
  ROUND(max(Sales),2) AS max_sales_subcategor
FROM superstore
GROUP BY category, `sub-category`
ORDER BY max_sales_subcategor DESC;
#min sales by month and region
SELECT 
  region,MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS month,
  ROUND(min(sales), 2) AS Monthly_sales
FROM superstore
GROUP BY region, MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y'))
ORDER BY month;
########### sales by month with minimum
SELECT 
    Region,
    MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS month,
    SUM(Sales) AS total_sales
FROM superstore
GROUP BY Region, MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y'))
ORDER BY total_sales ASC;
