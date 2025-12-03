-- VIEWS FOR COMMONLY USED AGGREGATIONS
-- ==========================================================================================================
-- View for Yearly Sales, Profit, and Quantity
CREATE OR REPLACE VIEW v_yearly_performance AS
SELECT
    "Order Year" AS order_year,
    ROUND(SUM("Sales"::numeric), 2) AS total_sales,
    ROUND(SUM("Profit"::numeric), 2) AS total_profit,
    SUM("Quantity") AS total_quantity
FROM superstore_data
GROUP BY "Order Year"
ORDER BY "Order Year";

-- View for Monthly Sales, Profit, and Quantity
CREATE OR REPLACE VIEW v_monthly_performance AS
SELECT
    "Order Year" AS order_year,
    "Number Of Order Month" AS month_number,
    "Order Month" AS order_month,
    ROUND(SUM("Sales"::numeric), 2) AS total_sales,
    ROUND(SUM("Profit"::numeric), 2) AS total_profit,
    SUM("Quantity") AS total_quantity
FROM superstore_data
GROUP BY "Order Year", "Number Of Order Month", "Order Month"
ORDER BY "Order Year", "Number Of Order Month";

-- View for Top 10 Products by Profit
CREATE OR REPLACE VIEW v_top_10_products_by_profit AS
SELECT
    "Product Name" AS product_name,
    ROUND(SUM("Sales"::numeric), 2) AS total_sales,
    ROUND(SUM("Profit"::numeric), 2) AS total_profit
FROM superstore_data
GROUP BY "Product Name"
ORDER BY total_profit DESC
LIMIT 10;

-- View for Category and Sub-Category Performance
CREATE OR REPLACE VIEW v_category_subcategory_performance AS
SELECT
    "Category" AS category,
    "Sub-Category" AS sub_category,
    ROUND(SUM("Sales"::numeric), 2) AS total_sales,
    ROUND(SUM("Profit"::numeric), 2) AS total_profit
FROM superstore_data
GROUP BY "Category", "Sub-Category"
ORDER BY total_profit DESC;

-- View for Regional Sales and Profit
CREATE OR REPLACE VIEW v_regional_performance AS
SELECT
    "Region" AS region,
