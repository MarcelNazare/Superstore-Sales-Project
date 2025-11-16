-- CREATING THE DATABASE 
CREATE DATABASE superstore_db;

-- CREATING MAIN SALES FACT TABLE
CREATE TABLE sales_fact(
    row_id INT PRIMARY KEY,
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(50),
    postal_code VARCHAR(50),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,2)
);

-- CREATING DIMENSION PRODUCTS TABLE
CREATE TABLE dim_products(

)

-- CREATING DIMENSION CUSTOMERS TABLE
CREATE TABLE dim_customers(
    
)

-- CREATING DIMENSION GEOGRAPHY TABLE
CREATE TABLE dim_geography(
    
)