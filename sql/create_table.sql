-- Create DATABASE named superstore_db
CREATE DATABASE superstore_db;
-- Drop table if it does exist
DROP TABLE IF EXISTS superstore_data;


CREATE TABLE IF NOT EXISTS superstore_data (
  row_id INT PRIMARY KEY,
  order_id VARCHAR(50),
  order_date DATE,
  ship_date DATE,
  ship_mode VARCHAR(50),
  -- CUSTOMER
  customer_id VARCHAR(50), 
  customer_name VARCHAR(100),
  segment VARCHAR(50),
  -- GEOGRAPHY
  country VARCHAR(50),
  city VARCHAR(100),
  state VARCHAR(50),
  postal_code VARCHAR(50),
  region VARCHAR(50),
  -- PRODUCTS
  product_id VARCHAR(50),
  category VARCHAR(50),
  sub_category VARCHAR(50),
  product_name VARCHAR(255),
  sales DECIMAL(10,2),
  quantity INT,
  discount DECIMAL(5,2),
  profit DECIMAL(10,2),
  order_processing_time INT,
  order_procesing_days VARCHAR(20),
  profit_margin DECIMAL(5,2),
  percentage_profit_margin DECIMAL(5,2),
  order_year INT,
  order_month VARCHAR(20),
  shipped_year INT,
    shipped_month VARCHAR(20),
    order_quarter VARCHAR(20),
    shipped_quarter VARCHAR(20)

);


