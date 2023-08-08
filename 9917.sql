/*
Compare each employee's salary with the average salary of the corresponding department.
Output the department, first name, and salary of employees along with the average salary of that department.

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

department	first_name	salary	AVG(salary) over (PARTITION BY department)
Audit	Shandler	1100	950
Audit	Jason	1000	950
Audit	Celine	1000	950
Audit	Michale	700	950
Management	Katty	150000	175000
*/

SELECT
    department,
    first_name,
    salary,
    avg_sal
FROM employee AS emp1
INNER JOIN (
    SELECT 
        department,
        AVG(salary) AS avg_sal
    FROM employee
    GROUP BY department
) AS emp2
USING(department)
ORDER BY department
