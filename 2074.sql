/*
Calculate the churn rate of September 2021 in percentages. The churn rate is the difference between the number of customers on the first day of the month and on the last day of the month, divided by the number of customers on the first day of a month.
Assume that if customer's contract_end is NULL, their contract is still active. Additionally, if a customer started or finished their contract on a certain day, they should still be counted as a customer on that day.

natera_subscriptions
Preview
user_id:
int
contract_start:
datetime
contract_end:
datetime

churn_rate
60
*/

WITH wb1 AS (
SELECT
    SUM(CASE WHEN contract_start <= CAST('2021-09-01' AS DATE) THEN 1 ELSE 0 END) AS cust_sep,
    SUM(CASE WHEN contract_end >= CAST('2021-09-30' AS DATE) OR contract_end IS NULL
        THEN 1 ELSE 0 END) AS active_sep
FROM natera_subscriptions
)
SELECT
    (cust_sep - active_sep) / cust_sep * 100 AS churn_rate
FROM wb1;
