/*
Find order details made by Jill and Eva.
Consider the Jill and Eva as first names of customers.
Output the order date, details and cost along with the first name.
Order records based on the customer id in ascending order.

Tables: customers, orders
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

first_name	order_date	order_details	total_order_cost
Jill	2019-02-01	Coat	25
Jill	2019-03-10	Shoes	80
Jill	2019-04-19	Suit	150
Jill	2019-04-01	Suit	50
Jill	2019-04-02	Skirt	30
*/

SELECT
    first_name,
    order_date,
    order_details,
    total_order_cost
FROM customers
INNER JOIN orders
ON customers.id = orders.cust_id
WHERE first_name IN ('Jill', 'Eva')
ORDER BY customers.id ASC
