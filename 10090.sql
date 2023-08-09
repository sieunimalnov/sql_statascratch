/*
Find the percentage of shipable orders.
Consider an order is shipable if the customer's address is known.

Tables: orders, customers
orders
Preview
id:
int
cust_id:
int
order_date:
datetime
order_details:
varchar
total_order_cost:
int
customers
Preview
id:
int
first_name:
varchar
last_name:
varchar
city:
varchar
address:
varchar
phone_number:
varchar

percent_shipable
28
*/

SELECT
    (AVG(CASE WHEN address IS NOT NULL THEN 1 ELSE 0 END) * 100) AS percent_shipable
FROM orders AS ord
INNER JOIN customers As cust
ON ord.cust_id = cust.id;
