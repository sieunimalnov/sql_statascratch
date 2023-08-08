/*
Given a table of purchases by date, calculate the month-over-month percentage change in revenue. The output should include the year-month date (YYYY-MM) and percentage change, rounded to the 2nd decimal point, and sorted from the beginning of the year to the end of the year.
The percentage change column will be populated from the 2nd month forward and can be calculated as ((this month's revenue - last month's revenue) / last month's revenue)*100.

Table: sf_transactions
id:
int
created_at:
datetime
value:
int
purchase_id:
int

ym	revenue_diff_pct
2019-01	
2019-02	-28.56
2019-03	23.35
2019-04	-13.84
2019-05	13.49
*/

WITH wb1 AS (
SELECT
    DATE_FORMAT(created_at, '%Y-%m') AS yr_mnth,
    SUM(value) AS revenue
FROM sf_transactions
GROUP BY DATE_FORMAT(created_at, '%Y-%m')
)
SELECT
    yr_mnth AS ym,
    ROUND((revenue - LAG(revenue, 1) OVER(ORDER BY yr_mnth ASC)) / 
        LAG(revenue, 1) OVER(ORDER BY yr_mnth ASC) * 100, 2) AS revenue_diff_pct
FROM wb1;
