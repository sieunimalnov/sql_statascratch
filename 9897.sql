/*
Find the employee with the highest salary per department.
Output the department name, employee's first name along with the corresponding salary.

Table: employee
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

department	employee_name	salary
Management	Richerd	250000
Sales	Mick	2200
Audit	Shandler	1100
*/

WITH wb1 AS (
SELECT
    department,
    MAX(salary) AS dept_high
FROM employee
GROUP BY department
)
SELECT
    employee.department,
    employee.first_name AS employee_name,
    employee.salary
FROM employee
INNER JOIN wb1
ON employee.department = wb1.department AND
    employee.salary = wb1.dept_high
