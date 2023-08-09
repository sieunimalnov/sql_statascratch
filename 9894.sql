/*
Find employees who are earning more than their managers. Output the employee's first name along with the corresponding salary.

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

employee_name	employee_salary
Richerd	250000
*/

SELECT
    emp.first_name,
    emp.salary AS employee_sal
FROM employee AS emp
INNER JOIN employee AS mgr
ON emp.manager_id = mgr.id
WHERE emp.salary > mgr.salary;
