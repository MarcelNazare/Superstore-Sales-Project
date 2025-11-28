-- Dropping the table if it exists
DROP TABLE IF EXISTS dim_geography;

-- Creating a dim_geography table
CREATE TABLE dim_geography(
    country VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(50),
    postal_code VARCHAR(50),
    region VARCHAR(50)

);

-- Inserting data into dim_geography table
INSERT INTO dim_geography (country, region, state, city, postal_code)
SELECT 
  country,
  region,
  state,
  city,
  postal_code
FROM superstore
WHERE city IS NOT NULL;  -- filter as needed