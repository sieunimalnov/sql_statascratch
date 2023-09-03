/*
Write a query that returns every employee that has ever worked for the company. For each employee, calculate the greatest number of employees that worked for the company during their tenure and the first date that number was reached. The termination date of an employee should not be counted as a working day.


Your output should have the employee ID, greatest number of employees that worked for the company during the employee's tenure, and first date that number was reached.

uber_employees
Preview
first_name:
varchar
last_name:
varchar
id:
int
hire_date:
datetime
termination_date:
datetime
salary:
int

id	maxemp	dateaq
1	57	2015-04-10
2	58	2017-02-03
3	58	2017-02-03
4	48	2013-12-23
5	58	2017-02-03
*/

WITH wb1 AS (
SELECT
    hire_date AS date,
    (+1) AS emp_counter
FROM uber_employees
UNION ALL
SELECT
    termination_date,
    (-1)
FROM uber_employees
WHERE termination_date IS NOT NULL
),
wb2 AS (
SELECT DISTINCT
    date,
    SUM(emp_counter) OVER(ORDER BY date ASC RANGE BETWEEN
        UNBOUNDED PRECEDING AND CURRENT ROW) AS emp_count
FROM wb1
)
SELECT
    id,
    (SELECT MAX(emp_count)
        FROM wb2
        WHERE wb2.date >= wb4.hire_date AND
            wb2.date < CAST(COALESCE(wb4.termination_date, '9999-12-31') AS DATE)
    ) AS maxemp,
    (SELECT MIN(date)
        FROM wb2 AS wb5
        WHERE (emp_count = (SELECT MAX(emp_count)
            FROM wb2
            WHERE wb2.date >= wb4.hire_date AND
                wb2.date < CAST(COALESCE(wb4.termination_date, '9999-12-31') AS DATE))
            AND (wb5.date >= wb4.hire_date AND
            wb5.date < CAST(COALESCE(wb4.termination_date, '9999-12-31') AS DATE))
    )) AS dateaq
FROM uber_employees AS wb4;
