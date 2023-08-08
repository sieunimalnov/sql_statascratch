/*
Calculate the total revenue from each customer in March 2019. Include only customers who were active in March 2019.


Output the revenue along with the customer id and sort the results based on the revenue in descending order.

Table: orders
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

cust_id	revenue
3	210
15	150
7	80
12	20
*/

SELECT
    cust_id,
    SUM(total_order_cost) AS revenue
FROM orders
WHERE EXTRACT(YEAR_MONTH FROM order_date) = 201903
GROUP BY cust_id
ORDER BY revenue DESC;
