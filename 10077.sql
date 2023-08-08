/*
Find the average total compensation based on employee titles and gender. Total compensation is calculated by adding both the salary and bonus of each employee. However, not every employee receives a bonus so disregard employees without bonuses in your calculation. Employee can receive more than one bonus.
Output the employee title, gender (i.e., sex), along with the average total compensation.

Tables: sf_employee, sf_bonus
sf_employee
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
email:
varchar
city:
varchar
address:
varchar
manager_id:
int
sf_bonus
Preview
worker_ref_id:
int
bonus:
int

employee_title	sex	avg_compensation
Senior Sales	M	5350
Auditor	M	2200
Sales	M	4600
Manager	F	209500
*/

WITH wb1 AS (
SELECT
    worker_ref_id,
    SUM(bonus) AS bonus
FROM sf_bonus
GROUP BY worker_ref_id
)
SELECT
    employee_title,
    sex,
    AVG(salary + bonus) AS avg_compensation
FROM wb1
INNER JOIN sf_employee
ON wb1.worker_ref_id = sf_employee.id
GROUP BY employee_title, sex;
