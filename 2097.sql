/*
You are given a dataset that provides the number of active users per day per premium account. A premium account will have an entry for every day that it’s premium. However, a premium account may be temporarily discounted and considered not paid, this is indicated by a value of 0 in the final_price column for a certain day. Find out how many premium accounts that are paid on any given day are still premium and paid 7 days later.
Output the date, the number of premium and paid accounts on that day, and the number of how many of these accounts are still premium and paid 7 days later. Since you are only given data for a 14 days period, only include the first 7 available dates in your output.

Table: premium_accounts_by_day
account_id:
varchar
entry_date:
datetime
users_visited_7d:
int
final_price:
int
plan_size:
int

entry_date	premium_paid_accounts	premium_paid_accounts_after_7d
2022-02-07	2	2
2022-02-08	3	2
2022-02-09	3	2
2022-02-10	4	3
2022-02-11	4	1
*/

WITH wb1 AS (
SELECT
    acc1.account_id,
    acc1.entry_date,
    acc1.final_price,
    acc2.entry_date AS date7,
    acc2.final_price AS price7
FROM premium_accounts_by_day AS acc1
LEFT JOIN premium_accounts_by_day AS acc2
ON acc1.account_id = acc2.account_id AND
    acc2.entry_date = DATE_ADD(acc1.entry_date, INTERVAL 7 DAY)
ORDER BY acc1.account_id ASC, acc1.entry_date ASC
)
SELECT
    entry_date,
    SUM(CASE WHEN final_price THEN 1 END) AS premium_paid_acounts,
    SUM(CASE WHEN final_price AND price7 THEN 1 END) AS premium_paid_accounts_after_7d
FROM wb1
GROUP BY entry_date
LIMIT 7;
