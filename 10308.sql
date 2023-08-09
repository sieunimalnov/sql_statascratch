/*
Write a query that calculates the difference between the highest salaries found in the marketing and engineering departments. Output just the absolute difference in salaries.

Tables: db_employee, db_dept
db_employee
Preview
id:
int
first_name:
varchar
last_name:
varchar
salary:
int
department_id:
int
db_dept
Preview
id:
int
department:
varchar

salary_difference
2400
*/

WITH wb1 As (
SELECT
    department,
    MAX(salary) as sal_high
FROM db_dept
INNER JOIN db_employee
ON db_dept.id = db_employee.department_id
WHERE department IN ('marketing', 'engineering')
GROUP BY department
)
SELECT
    ABS((SELECT sal_high FROM wb1 WHERE department = "marketing") - 
        (SELECT sal_high FROM wb1 WHERE department = "engineering")) AS salary_difference;
