/*
You have been asked to find the 5 most lucrative products in terms of total revenue for the first half of 2022 (from January to June inclusive).


Output their IDs and the total revenue.

Table: online_orders
product_id:
int
promotion_id:
int
cost_in_dollars:
int
customer_id:
int
date:
datetime
units_sold:
int

product_id	revenue
2	207
3	201
5	199
1	65
6	56
*/

SELECT
    product_id,
    SUM(cost_in_dollars * units_sold) AS total_revenue
FROM online_orders
WHERE MONTH(date) BETWEEN 1 AND 6
GROUP BY product_id
ORDER BY total_revenue DESC
LIMIT 5;
