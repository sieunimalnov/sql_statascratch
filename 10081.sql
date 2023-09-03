/*
Find the number of employees who received the bonus and who didn't. Bonus values in employee table are corrupted so you should use  values from the bonus table. Be aware of the fact that employee can receive more than bonus.
Output value inside has_bonus column (1 if they had bonus, 0 if not) along with the corresponding number of employees for each.

employee
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
bonus
Preview
worker_ref_id:
int
bonus_amount:
int
bonus_date:
datetime


has_bonus	n_employees
0	27
1	3
*/

WITH wb1 AS (
SELECT
    id,
    COUNT(bonus_amount) AS n_bonus
FROM employee AS emp
LEFT JOIN bonus As bon
ON emp.id = bon.worker_ref_id
GROUP BY emp.id
)
SELECT
    (CASE n_bonus WHEN 0 THEN 0 ELSE 1 END) AS has_bonus,
    COUNT(id) AS n_employees
FROM wb1
GROUP BY (CASE n_bonus WHEN 0 THEN 0 ELSE 1 END);
