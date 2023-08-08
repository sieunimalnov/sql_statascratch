/*
Find the customer with the highest daily total order cost between 2019-02-01 to 2019-05-01. If customer had more than one order on a certain day, sum the order costs on daily basis. Output customer's first name, total cost of their items, and the date.


For simplicity, you can assume that every first name in the dataset is unique.

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

first_name	order_date	total_cost
Jill	2019-04-19	275
*/

SELECT
    first_name,
    order_date,
    SUM(total_order_cost) AS total_cost
FROM customers
INNER JOIN orders
ON customers.id = orders.cust_id
WHERE order_date BETWEEN CAST('2019-02-01' AS DATE) AND CAST('2019-05-01' AS DATE)
GROUP BY
    first_name,
    order_date
ORDER BY total_cost DESC
LIMIT 1;
