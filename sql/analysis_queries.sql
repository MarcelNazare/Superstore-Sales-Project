-- SALES PERFOMANCE ANALYSIS QUERIES
-- ==========================================================================================================
-- 1. What are the total sales, profit and quantity by year, quarter and month
SELECT 
    "Order Year" as Order_Year,
    ROUND(SUM("Sales"::numeric),2) as Total_Sales,
    ROUND(SUM("Profit"::numeric),2) as Total_Profit,
    SUM("Quantity") as Total_Quantity
FROM superstore_data
GROUP BY Order_Year
ORDER BY Total_Sales desc;
-- By Quarter
SELECT 
    "Order Quarter" as Order_Quarter,
    ROUND(SUM("Sales"::numeric),2) as Total_Sales,
    ROUND(SUM("Profit"::numeric),2) as Total_Profit,
    SUM("Quantity") as Total_Quantity
	
FROM superstore_data
GROUP BY Order_Quarter
ORDER BY Total_Sales desc;
-- By Month
SELECT 
    "Order Month" as Order_Month,
    ROUND(SUM("Sales"::numeric),2) as Total_Sales,
    ROUND(SUM("Profit"::numeric),2) as Total_Profit,
    SUM("Quantity") as Total_Quantity,
    "Number Of Order Month" as Month_Number
    
FROM superstore_data
GROUP BY  Month_Number,Order_Month
ORDER BY Total_Sales desc;
-- ==========================================================================================================
-- ==========================================================================================================
-- 2. What are the Year over Year Growth Rates
WITH yearly AS (
  SELECT
    "Order Year" AS year,
    ROUND(SUM("Sales"::numeric),2) AS sales,
    ROUND(SUM("Profit"::numeric),2) AS profit
  FROM superstore_data
  WHERE "Order Year" IS NOT NULL
  GROUP BY 1
)
SELECT
  year,
  -- Sales
  sales,
  LAG(sales) OVER (ORDER BY year) AS prev_sales,
  (sales - LAG(sales) OVER (ORDER BY year)) AS sales_yoy_abs,
  CASE
    WHEN LAG(sales) OVER (ORDER BY year) = 0 THEN NULL
    ELSE ROUND((sales - LAG(sales) OVER (ORDER BY year))::numeric / LAG(sales) OVER (ORDER BY year), 4)
  END AS sales_yoy_pct,
  -- Profit
  profit,
  LAG(profit) OVER (ORDER BY year) AS prev_profit,
  (profit - LAG(profit) OVER (ORDER BY year)) AS profit_yoy_abs,
  CASE
    WHEN LAG(profit) OVER (ORDER BY year) = 0 THEN NULL
    ELSE ROUND((profit - LAG(profit) OVER (ORDER BY year))::numeric / LAG(profit) OVER (ORDER BY year), 4)
  END AS profit_yoy_pct
FROM yearly
ORDER BY year;
-- ==========================================================================================================
-- ==========================================================================================================
-- 3 What are the sales trends over time
SELECT 
    "Order Year" as Order_Year,
    "Order Month" as Order_Month,
    "Number Of Order Month" as Month_Number,
    ROUND(SUM("Sales"::numeric),2) as Total_Sales
FROM superstore_data
GROUP BY 
    Order_Year,
    Order_Month,
    Month_Number
ORDER BY 
    Order_Year,
    Month_Number;


-- ==========================================================================================================
-- ==========================================================================================================
-- PRODUCT ANALYSIS QUERIES
-- 4. What are the top 10 products by sales, profit 
SELECT 
    "Product Name" as Product_Name,
    ROUND(SUM("Sales"::numeric),2) as Total_Sales,
    ROUND(SUM("Profit"::numeric),2) as Total_Profit
FROM superstore_data
GROUP BY Product_Name
ORDER BY Total_Profit desc
LIMIT 10;
-- ==========================================================================================================
-- ==========================================================================================================
-- 5. What the best and worst performing categories and sub-categories
SELECT 
    "Category" as Category,
    "Sub-Category" as Sub_Category,
    ROUND(SUM("Sales"::numeric),2) as Total_Sales,
    ROUND(SUM("Profit"::numeric),2) as Total_Profit
FROM superstore_data
GROUP BY 
    Category,
    Sub_Category
ORDER BY Total_Profit desc;
-- ==========================================================================================================
-- ==========================================================================================================
-- 6. What are the products with highest profit margins
SELECT
    "Product Name" as Product_Name,
    ROUND(SUM("Sales"::numeric),2) as Total_Sales,
    ROUND(SUM("Profit"::numeric),2) as Total_Profit,
    CASE
        WHEN SUM("Sales"::numeric) = 0 THEN NULL
        ELSE ROUND((SUM("Profit"::numeric) / SUM("Sales"::numeric))::numeric,4)
    END AS Profit_Margin
FROM superstore_data
GROUP BY Product_Name
ORDER BY Profit_Margin desc
LIMIT 10;
-- ==========================================================================================================
-- ==========================================================================================================
-- 7. Correlation between discount and profit
SELECT 
    "Discount" as Discount,
    ROUND(AVG("Profit"::numeric),2) as Avg_Profit  
FROM superstore_data
GROUP BY Discount
ORDER BY Discount;
-- ==========================================================================================================
-- ==========================================================================================================
-- GEOGRAPHIC ANALYSIS QUERIES
-- 8. What are sales by region, state and city
SELECT
    "Region" as Region,
    ROUND(SUM("Sales"::numeric),2) as Total_Sales,
    ROUND(SUM("Profit"::numeric),2) as Total_Profit
FROM superstore_data
GROUP BY Region
ORDER BY Total_Sales desc;
-- By State
SELECT
    "State" as State,
    ROUND(SUM("Sales"::numeric),2) as Total_Sales,
    ROUND(SUM("Profit"::numeric),2) as Total_Profit
FROM superstore_data
GROUP BY State
ORDER BY Total_Sales desc
LIMIT 10;
-- By City
SELECT
    "City" as City,
    ROUND(SUM("Sales"::numeric),2) as Total_Sales,
    ROUND(SUM("Profit"::numeric),2) as Total_Profit
FROM superstore_data
GROUP BY City
ORDER BY Total_Sales desc
LIMIT 10;
-- ==========================================================================================================
-- ==========================================================================================================
-- 9. What are the regional profit comparisons
SELECT
    "Region" as Region,
    ROUND(SUM("Sales"::numeric),2) as Total_Sales,
    ROUND(SUM("Profit"::numeric),2) as Total_Profit,
    CASE
        WHEN SUM("Sales"::numeric) = 0 THEN NULL
        ELSE ROUND((SUM("Profit"::numeric) / SUM("Sales"::numeric))::numeric,4)
    END AS Profit_Margin
FROM superstore_data
GROUP BY Region
ORDER BY Profit_Margin desc;
-- ==========================================================================================================
-- ==========================================================================================================
-- What are the top products by performance 
SELECT 
    "Region" as Region,
    "Product Name" as Product_Name,
    ROUND(SUM("Sales"::numeric),2) as Total_Sales,
    ROUND(SUM("Profit"::numeric),2) as Total_Profit
FROM superstore_data
GROUP BY 
    Region,
    Product_Name
ORDER BY 
    Region,
    Total_Profit desc;
-- ==========================================================================================================
-- ==========================================================================================================
-- CUSTOMER ANALYSIS QUERIES
-- 10. What is the top customer segment by performance
SELECT 
    "Segment" as Customer_Segment,
    ROUND(SUM("Sales"::numeric),2) as Total_Sales,
    ROUND(SUM("Profit"::numeric),2) as Total_Profit 
FROM superstore_data
GROUP BY Customer_Segment
ORDER BY Total_Profit desc;
-- ==========================================================================================================
-- ==========================================================================================================
-- 11. Who are the top customers by sales value
SELECT 
    "Customer Name" as Customer_Name,
    ROUND(SUM("Sales"::numeric),2) as Total_Sales,
    ROUND(SUM("Profit"::numeric),2) as Total_Profit 
FROM superstore_data
GROUP BY Customer_Name
ORDER BY Total_Sales desc
LIMIT 10;
-- ==========================================================================================================
-- ==========================================================================================================
-- 12. What are the customer ordering patterns
SELECT 
    "Customer Name" as Customer_Name,
    COUNT("Order ID") as Number_of_Orders,
    ROUND(SUM("Sales"::numeric),2) as Total_Sales,
    ROUND(SUM("Profit"::numeric),2) as Total_Profit 
FROM superstore_data
GROUP BY Customer_Name
ORDER BY Number_of_Orders desc
LIMIT 10;
-- ==========================================================================================================
-- ==========================================================================================================
-- OPERATIONAL METRICS QUERIES
--13. What the is the average shipping time by ship mode
SELECT
    "Ship Mode" as Ship_Mode,
    ROUND(AVG("Order Processing Days"::numeric),2) as Avg_Shipping_Time_Days   
FROM superstore_data
GROUP BY Ship_Mode
ORDER BY Avg_Shipping_Time_Days;
-- ==========================================================================================================
-- ==========================================================================================================
-- 14. What is order fulfillment analysis
SELECT 
    "Order Year" as Order_Year,
    "Order Month" as Order_Month,
    "Number Of Order Month" as Month_Number,
    COUNT("Order ID") as Number_of_Orders,
    ROUND(AVG("Order Processing Days"::numeric),2) as Avg_Shipping_Time_Days
FROM superstore_data
GROUP BY 
    Order_Year,
    Order_Month,
    Month_Number  
ORDER BY 
    Order_Year,
    Month_Number;
-- ==========================================================================================================
-- ==========================================================================================================