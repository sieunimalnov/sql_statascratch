/*
Output share of US users that are active. Active users are the ones with an "open" status in the table.

Table: fb_active_users
user_id:
int
name:
varchar
status:
varchar
country:
varchar

active_users_share
0.5
*/

SELECT
    AVG(CASE WHEN status = 'open' THEN 1 ELSE 0 END) AS active_users_share
FROM fb_active_users
WHERE country = 'USA';
