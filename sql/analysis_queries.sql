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
