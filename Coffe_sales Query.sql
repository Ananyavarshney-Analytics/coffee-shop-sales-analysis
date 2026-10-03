SELECT 
    *,
    EXTRACT(HOUR FROM transaction_time) AS hour,
    EXTRACT(DAY FROM transaction_date) AS day,
    EXTRACT(MONTH FROM transaction_date) AS month,
    (transaction_qty * unit_price) AS revenue
FROM coffee_sales;

SELECT * FROM coffee_sales LIMIT 10;

SELECT 
    transaction_id,
    transaction_date,
    transaction_time,
    transaction_qty,
    store_location,
    product_category,
    product_type,
    product_detail,
    unit_price,

    EXTRACT(HOUR FROM transaction_time) AS hour,
    EXTRACT(DAY FROM transaction_date) AS day,
    EXTRACT(MONTH FROM transaction_date) AS month,

    (transaction_qty * unit_price) AS revenue

FROM coffee_sales;


SELECT 
    ROUND(SUM(transaction_qty * unit_price)::numeric, 2) AS total_revenue,
    COUNT(DISTINCT transaction_id) AS total_orders,
    ROUND(
    (SUM(transaction_qty * unit_price) / COUNT(DISTINCT transaction_id))::numeric, 2) 
      AS avg_order_value,
    SUM(transaction_qty) AS total_quantity
FROM coffee_sales;

SELECT 
    EXTRACT(MONTH FROM transaction_date) AS month,
    ROUND(SUM(transaction_qty * unit_price)::numeric, 2) AS revenue
FROM coffee_sales
GROUP BY month
ORDER BY month;

SELECT 
    product_category,
    ROUND(SUM(transaction_qty * unit_price)::numeric, 2) AS revenue
FROM coffee_sales
GROUP BY product_category
ORDER BY revenue DESC;

SELECT 
    product_detail,
    ROUND(SUM(transaction_qty * unit_price)::numeric, 2) AS revenue
FROM coffee_sales
GROUP BY product_detail
ORDER BY revenue DESC
LIMIT 5;

SELECT 
    store_location,
    ROUND(SUM(transaction_qty * unit_price)::numeric, 2) AS revenue
FROM coffee_sales
GROUP BY store_location
ORDER BY revenue DESC;

SELECT 
    EXTRACT(HOUR FROM transaction_time) AS hour,
    ROUND(SUM(transaction_qty * unit_price)::numeric, 2) AS revenue
FROM coffee_sales
GROUP BY hour
ORDER BY hour;

