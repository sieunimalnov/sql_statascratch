/*
Calculate each user's average session time. A session is defined as the time difference between a page_load and page_exit. For simplicity, assume a user has only 1 session per day and if there are multiple of the same events on that day, consider only the latest page_load and earliest page_exit, with an obvious restriction that load time event should happen before exit time event . Output the user_id and their average session time.

Table: facebook_web_log
user_id:
int
timestamp:
datetime
action:
varchar

user_id	session_time
0	1883.5
1	35
*/

WITH lg AS (
SELECT
    user_id,
    DATE(timestamp) AS date,
    TIME_TO_SEC(timestamp) AS time,
    action
FROM facebook_web_log
WHERE ACTION IN ('page_load', 'page_exit')
),
ld AS (
SELECT
    user_id,
    date,
    MAX(time) AS time
FROM lg
WHERE action = 'page_load'
GROUP BY user_id, date
),
ex AS (
SELECT
    lg.user_id,
    lg.date,
    ld.time AS ld_time,
    MIN(lg.time) AS ex_time
FROM lg
INNER JOIN ld
ON (lg.user_id = ld.user_id) AND
    (lg.date = ld.date)
WHERE (lg.action = 'page_exit') AND (ld.time < lg.time)
GROUP BY
    lg.user_id,
    lg.date,
    ld.time
)
SELECT
    user_id,
    AVG(ex_time - ld_time) AS session_time
FROM ex
GROUP BY user_id;
