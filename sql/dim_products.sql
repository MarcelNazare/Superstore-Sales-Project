-- Drop table if it exists
DROP TABLE IF EXISTS dim_products;

-- Create table
CREATE TABLE dim_products(
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255)
);

-- Insert data into table
INSERT INTO dim_products (product_id, product_name, category, sub_category)
SELECT
  product_id ,
  product_name,
  category,
  sub_category
FROM superstore
WHERE product_id IS NOT NULL;