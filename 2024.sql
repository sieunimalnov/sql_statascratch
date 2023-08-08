/*
Write a query that returns the number of unique users per client per month

Table: fact_events
id:
int
time_id:
datetime
user_id:
varchar
customer_id:
varchar
client_id:
varchar
event_type:
varchar
event_id:
int

client_id	month	users_num
desktop	2	13
desktop	3	16
desktop	4	11
mobile	2	9
mobile	3	14
*/

SELECT
    client_id,
    MONTH(time_id) As month,
    COUNT(DISTINCT user_id) AS users
FROM fact_events
GROUP BY
    client_id,
    MONTH(time_id)
