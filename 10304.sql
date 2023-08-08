/*
Identify projects that are at risk for going overbudget. A project is considered to be overbudget if the cost of all employees assigned to the project is greater than the budget of the project.


You'll need to prorate the cost of the employees to the duration of the project. For example, if the budget for a project that takes half a year to complete is $10K, then the total half-year salary of all employees assigned to the project should not exceed $10K. Salary is defined on a yearly basis, so be careful how to calculate salaries for the projects that last less or more than one year.


Output a list of projects that are overbudget with their project name, project budget, and prorated total employee expense (rounded to the next dollar amount).


HINT: to make it simpler, consider that all years have 365 days. You don't need to think about the leap years.

Tables: linkedin_projects, linkedin_emp_projects, linkedin_employees
linkedin_projects
Preview
id:
int
title:
varchar
budget:
int
start_date:
datetime
end_date:
datetime
linkedin_emp_projects
Preview
emp_id:
int
project_id:
int
linkedin_employees
Preview
id:
int
first_name:
varchar
last_name:
varchar
salary:
int

title	budget	prorated_employee_expense
Project1	29498	36293
Project11	11705	31606
Project12	10468	62843
Project14	30014	36774
Project16	19922	21875
*/

WITH wb1 AS (
SELECT
    proj.id AS proj_id,
    proj.title AS proj_title,
    proj.budget AS proj_budget,
    DATEDIFF(end_date, start_date) AS proj_days,
    emp_proj.emp_id AS emp_id,
    emp.salary AS emp_sal
FROM linkedin_projects AS proj
INNER JOIN linkedin_emp_projects AS emp_proj
ON proj.id = emp_proj.project_id
INNER JOIN linkedin_employees AS emp
ON emp_proj.emp_id = emp.id
ORDER BY proj.id ASC
)
SELECT
    proj_title AS title,
    proj_budget AS budget,
    CEILING(SUM((emp_sal / 365 * proj_days))) AS prorated_employee_expense
FROM wb1
GROUP BY proj_title, proj_budget
HAVING CEILING(SUM((emp_sal / 365 * proj_days))) > proj_budget
ORDER BY title ASC
