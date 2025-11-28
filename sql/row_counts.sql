-- Row counts
SELECT 'raw rows' as what, COUNT(*) FROM superstore;
SELECT 'geography' as what, COUNT(*) FROM dim_geography;
SELECT 'customer' as what, COUNT(*) FROM dim_customers;
SELECT 'product' as what, COUNT(*) FROM dim_products;