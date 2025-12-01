-- Drop existing tables
DROP TABLE IF EXISTS dim_customers;

-- Create dim_customers table
CREATE TABLE dim_customers(
    customer_id VARCHAR(50) ,
    customer_name VARCHAR(100),
    segment VARCHAR(50)

);

-- Insert data into table
INSERT INTO dim_customers (customer_id, customer_name, segment)
SELECT
  customer_id,
  customer_name,
  segment
FROM superstore_data
WHERE customer_id IS NOT NULL;