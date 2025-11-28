-- Example: products with null names
SELECT product_id FROM dim_products WHERE product_name IS NULL LIMIT 20;