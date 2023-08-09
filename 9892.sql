/*
Find the second highest salary of employees.

Table: employee
Preview
id:
int
first_name:
varchar
last_name:
varchar
age:
int
sex:
varchar
employee_title:
varchar
department:
varchar
salary:
int
target:
int
bonus:
int
email:
varchar
city:
varchar
address:
varchar
manager_id:
int

salary
200000
*/

WITH wb1 AS (
SELECT
    salary,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
FROM employee
)
SELECT DISTINCT salary
FROM wb1
WHERE rnk = 2;
