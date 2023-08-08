/*
Find the number of Apple product users and the number of total users with a device and group the counts by language. Assume Apple products are only MacBook-Pro, iPhone 5s, and iPad-air. Output the language along with the total number of Apple users and users with any device. Order your results based on the number of total users in descending order.

Tables: playbook_events, playbook_users
playbook_events
Preview
user_id:
int
occurred_at:
datetime
event_type:
varchar
event_name:
varchar
location:
varchar
device:
varchar
playbook_users
Preview
user_id:
int
created_at:
datetime
company_id:
int
language:
varchar
activated_at:
datetime
state:
varchar

language	n_apple_user	n_total_users
english	11	45
spanish	3	9
japanese	2	6
french	0	5
russian	0	5
*/

WITH wb1 AS (
SELECT
    e.user_id,
    u.language,
    e.device,
    CASE WHEN UPPER(device) LIKE UPPER('%macbook_pro%') OR
        UPPER(device) LIKE UPPER('%iphone_5s%') OR
        UPPER(device) LIKE UPPER('%ipad%_air')
        THEN e.user_id END AS apple_users
FROM playbook_events AS e
INNER JOIN playbook_users AS u
ON e.user_id = u.user_id
ORDER BY e.user_id
)
SELECT
    language,
    COUNT(DISTINCT apple_users) AS n_apple_user,
    COUNT(DISTINCT user_id) AS n_total_users
FROM wb1
GROUP BY language
ORDER BY n_total_users DESC;
