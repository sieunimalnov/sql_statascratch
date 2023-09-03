/*
Calculate the share of new and existing users for each month in the table. Output the month, share of new users, and share of existing users as a ratio.
New users are defined as users who started using services in the current month (there is no usage history in previous months). Existing users are users who used services in current month, but they also used services in any previous month.
Assume that the dates are all from the year 2020.
HINT: Users are contained in user_id column

fact_events
Preview
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

month	share_new_users	share_existing_users
2	1	0
3	0.294	0.706
4	0.143	0.857
*/

WITH wb1 AS (
SELECT DISTINCT
    user_id,
    MONTH(time_id) AS mon
FROM fact_events
),
wb2 AS (
SELECT
    user_id,
    mon,
    RANK() OVER(PARTITION BY user_id ORDER BY mon ASC) AS rnk
FROM wb1
),
wb3 AS (
SELECT
    mon,
    (CASE rnk WHEN 1 THEN 1 ELSE 0 END) AS new_usr,
    COUNT(*) AS n_usr
FROM wb2
GROUP BY mon, (CASE rnk WHEN 1 THEN 1 ELSE 0 END)
),
wb7 AS (
SELECT DISTINCT
    mon,
    (SELECT n_usr
        FROM wb3 AS wb5
        WHERE wb5.mon = wb4.mon AND
            new_usr = 1
    ) AS new_users,
    COALESCE((SELECT n_usr
        FROM wb3 AS wb6
        WHERE wb6.mon = wb4.mon AND
            new_usr = 0
    ), 0) AS existing_users
FROM wb3 AS wb4
)
SELECT
    mon AS month,
    new_users / (new_users + existing_users) AS share_new_users,
    existing_users / (new_users + existing_users) AS share_existing_users
FROM wb7;
