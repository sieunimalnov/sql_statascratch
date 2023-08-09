/*
Write a query that'll identify returning active users. A returning active user is a user that has made a second purchase within 7 days of any other of their purchases. Output a list of user_ids of these returning active users.

Table: amazon_transactions
id:
int
user_id:
int
item:
varchar
created_at:
datetime
revenue:
int

user_id
100
103
105
109
110
*/

WITH wb1 AS (
SELECT
    user_id,
    created_at AS date,
    DATEDIFF(LEAD(created_at) OVER(PARTITION BY user_id ORDER BY created_at ASC),
        created_at) AS nxt_date
FROM amazon_transactions
)
SELECT DISTINCT
    user_id
FROM wb1
WHERE nxt_date <= 7;
