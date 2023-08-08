/*
Select the most popular client_id based on a count of the number of users who have at least 50% of their events from the following list: 'video call received', 'video call sent', 'voice call received', 'voice call sent'.

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

client_id
desktop
*/

WITH wb1 AS (
SELECT
    user_id,
    (COUNT(client_id) / (
        SELECT count(client_id)
        FROM fact_events AS f2
        WHERE f2.user_id = f1.user_id
        GROUP BY user_id
    )) AS count_perc
FROM fact_events AS f1
WHERE event_type IN 
    ('video call received', 'video call sent', 'voice call received', 'voice call sent')
GROUP BY user_id
)
SELECT
    fact_events.client_id
FROM wb1
INNER JOIN fact_events
ON wb1.user_id = fact_events.user_id
WHERE wb1.count_perc >= 0.5
GROUP BY fact_events.client_id
ORDER BY COUNT(DISTINCT wb1.user_id) DESC
LIMIT 1;
