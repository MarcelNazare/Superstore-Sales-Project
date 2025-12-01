-- Use psql's client-side \copy so the client (not the server) reads the file

-- order_id: unique order identifier
-- order_date: date of the order (YYYY-MM-DD)
-- ship_date: date the order was shipped (YYYY-MM-DD)
-- ship_mode: shipping method
-- customer_id: unique customer identifier
-- customer_name: name of the customer
-- segment: customer segment (e.g., Consumer, Corporate)
-- country: country name
-- city: city name
-- state: state name
-- postal_code: postal code
-- region: region name
-- product_id: unique product identifier
-- category: product category
-- sub_category: product sub-category
-- product_name: name of the product
-- sales: sales amount (numeric)
-- quantity: quantity sold (integer)
-- discount: discount applied (decimal)
-- profit: profit amount (numeric)
copy superstore_data (
	row_id,         -- unique row identifier
	order_id,       -- unique order identifier
	order_date,     -- date of the order
	ship_date,      -- date the order was shipped
	ship_mode,      -- shipping method
	customer_id,    -- unique customer identifier
	customer_name,  -- name of the customer
	segment,        -- customer segment
	country,        -- country name
	city,           -- city name
	state,          -- state name
	postal_code,    -- postal code
	region,         -- region name
	product_id,     -- unique product identifier
	category,       -- product category
	sub_category,   -- product sub-category
	product_name,   -- name of the product
	sales,          -- sales amount
	quantity,       -- quantity sold
	discount,       -- discount applied
	profit  ,        -- profit amount
    order_processing_time,
  order_procesing_days,
  profit_margin,
  percentage_profit_margin,
  order_year,
  order_month ,
  shipped_year,
    shipped_month,
    order_quarter ,
    shipped_quarter
)
FROM 'C:/Users/marcel/Documents/Data Analysis Projects/Superstore Sales Project/data/processed/superstore_cleaned.csv'
WITH (FORMAT csv, HEADER true, ENCODING 'LATIN1');
