/*
Find the monthly retention rate of users for each account separately for Dec 2020 and Jan 2021. Retention rate is the percentage of active users an account retains over a given period of time. In this case, assume the user is retained if he/she stays with the app in any future months. For example, if a user was active in Dec 2020 and has activity in any future month, consider them retained for Dec. You can assume all accounts are present in Dec 2020 and Jan 2021. Your output should have the account ID and the Jan 2021 retention rate divided by Dec 2020 retention rate.

Table: sf_events
date:
datetime
account_id:
varchar
user_id:
varchar

account_id	retention_rate
A1	1
A2	1
A3	0
*/

WITH dec2020 AS (
SELECT DISTINCT
    account_id,
    user_id
FROM sf_events
WHERE EXTRACT(YEAR_MONTH FROM date) = 202012
),
jan2021 AS (
SELECT DISTINCT
    account_id,
    user_id
FROM sf_events
WHERE EXTRACT(YEAR_MONTH FROM date) = 202101
),
feb2021 AS (
SELECT DISTINCT
    account_id,
    user_id
FROM sf_events
WHERE EXTRACT(YEAR_MONTH FROM date) = 202102
),
ret_dec AS (
SELECT 
    dec2020.account_id,
    AVG(CASE WHEN dec2020.user_id = jan2021.user_id OR 
        dec2020.user_id = feb2021.user_id THEN 1 ELSE 0 END) AS retention_dec
FROM dec2020
LEFT JOIN jan2021
ON dec2020.account_id = jan2021.account_id AND
    dec2020.user_id = jan2021.user_id
LEFT JOIN feb2021
ON dec2020.account_id = feb2021.account_id AND
    dec2020.user_id = feb2021.user_id
GROUP BY dec2020.account_id
),
ret_jan AS (
SELECT
    jan2021.account_id,
    AVG(CASE WHEN jan2021.user_id = feb2021.user_id THEN 1 ELSE 0 END) AS retention_jan
FROM jan2021
LEFT JOIN feb2021
ON jan2021.account_id = feb2021.account_id AND
    jan2021.user_id = feb2021.user_id
GROUP BY jan2021.account_id
)
SELECT
    ret_dec.account_id,
    ret_jan.retention_jan / ret_dec.retention_dec AS retention_rate
FROM ret_dec
INNER JOIN ret_jan
ON ret_dec.account_id = ret_jan.account_id;
