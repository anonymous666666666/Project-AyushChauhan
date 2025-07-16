-- 1. Database Creation

Create Database SalesDB;
USE SalesDB;


-- Create a table named "sales_sample" with the specified columns:

Create Table sales_sample (
    Product_Id Int,
    Region Varchar(50),
    Date DATE,
    Sales_Amount Int
);

-- 2. Data Creation 
-- Insert 10 sample records into the "sales_sample" table, representing sales data.

Insert Into sales_sample (Product_Id, Region, Date, Sales_Amount) Values
(101, 'East',  '2025-07-01', 1000),
(102, 'East',  '2025-07-02', 1500),
(101, 'West',  '2025-07-01', 1100),
(103, 'West',  '2025-07-03', 2000),
(102, 'North', '2025-07-02', 1200),
(104, 'South', '2025-07-01', 1300),
(101, 'East',  '2025-07-03', 1700),
(104, 'South', '2025-07-02', 1000),
(103, 'West',  '2025-07-02', 1400),
(102, 'North', '2025-07-03', 1600);

Select * from sales_sample;

-- 3. Perform OLAP operations 
-- a) Drill Down-Analyze sales data at a more detailed level. Write a query to perform drill down 
-- from region to product level to understand sales performance.

Select Region, Product_Id, SUM(Sales_Amount) As Total_Sales
From sales_sample
Group By Region, Product_Id
Order By Region, Product_Id;

-- b) Rollup- To summarize sales data at different levels of granularity. Write a query to perform 
-- roll up from product to region level to view total sales by region.

Select Region, Product_Id, SUM(Sales_Amount) As Total_Sales
From sales_sample
Group By Region, Product_Id With Rollup;


-- c) Cube - To analyze sales data from multiple dimensions simultaneously. Write a query to 
-- Explore sales data from different perspectives, such as product, region, and date. 

 -- by Product_id ( Done in online SQL server https://sqlfiddle.com/sql-server)
SELECT 
    ISNULL(CAST(Product_Id AS VARCHAR), 'All Products') AS Product_Id,
    SUM(Sales_Amount) AS Total_Sales
FROM 
    sales_sample
GROUP BY 
    CUBE (Product_Id)
ORDER BY 
    Product_Id;

(102, 'North', '2025-07-03', 1600);

-- by Region ( Done in online SQL server https://sqlfiddle.com/sql-server)
SELECT 
    ISNULL(Region, 'All Regions') AS Region,
    SUM(Sales_Amount) AS Total_Sales
FROM 
    sales_sample
GROUP BY 
    CUBE (Region)
ORDER BY 
    Region;

-- by Date ( Done in online SQL server https://sqlfiddle.com/sql-server)


-- d) Slice- To extract a subset of data based on specific criteria. Write a query to slice the data to 
-- view sales for a particular region or date range. 

Select * From sales_sample
Where Region = 'East';

-- Slice by date range
Select * From sales_sample
Where Date Between '2025-07-01' AND '2025-07-02';

-- e) Dice - To extract data based on multiple criteria. Write a query to view sales for specific 
-- combinations of product, region, and date

Select * From sales_sample
Where Region = 'West'
  And Product_Id IN (101, 103)
  And Date Between '2025-07-01' AND '2025-07-03';




