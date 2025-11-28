DROP TABLE IF EXISTS superstore_data;

COPY superstore_data (
  row_id, order_id, order_date, ship_date, ship_mode,
  customer_id, customer_name, segment, country, city, state,
  postal_code, region, product_id, category, sub_category,
  product_name, sales, quantity, discount, profit
)
FROM 'C:/Users/marcel/Documents/Data Analysis Projects/Superstore Sales Project/data/processed/superstore_cleaned.csv'
WITH (FORMAT csv, HEADER true, ENCODING 'LATIN1');


-- In a .sql script executed by psql, or directly in psql interactive:
COPY superstore_data (
  row_id, order_id, order_date, ship_date, ship_mode,
  customer_id, customer_name, segment, country, city, state,
  postal_code, region, product_id, category, sub_category,
  product_name, sales, quantity, discount, profit
)
FROM 'C:\\Users\\marcel\\Documents\\Data Analysis Projects\\Superstore Sales Project\\data\\processed\\superstore_cleaned.csv'
WITH (FORMAT csv, HEADER true, ENCODING 'LATIN1');