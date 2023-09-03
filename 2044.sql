/*
Write a query to find the number of days between the longest and least tenured employee still working for the company. Your output should include the number of employees with the longest-tenure, the number of employees with the least-tenure, and the number of days between both the longest-tenured and least-tenured hiring dates.

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

shortest_tenured_count	longest_tenured_count	days_diff
2	3	3944
*/

WITH wb1 AS (
SELECT
    id,
    hire_date AS start_date,
    COALESCE(termination_date, CURDATE()) AS end_date
FROM uber_employees
WHERE termination_date IS NULL
)
SELECT
    (SELECT COUNT(id)
        FROM wb1
        WHERE DATEDIFF(end_date, start_date) = (
            SELECT MIN(DATEDIFF(end_date, start_date))
            FROM wb1
        )
    ) AS shortest_tenured_count,
        (SELECT COUNT(id)
        FROM wb1
        WHERE DATEDIFF(end_date, start_date) = (
            SELECT MAX(DATEDIFF(end_date, start_date))
            FROM wb1
        )
    ) AS longest_tenured_count,
    MAX(DATEDIFF(end_date, start_date)) -
        MIN(DATEDIFF(end_date, start_date)) AS days_diff
FROM wb1;
