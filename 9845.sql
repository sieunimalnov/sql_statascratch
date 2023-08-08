/*
Find the number of employees working in the Admin department that joined in April or later.

Table: worker
worker_id:
int
first_name:
varchar
last_name:
varchar
salary:
int
joining_date:
datetime
department:
varchar

n_admins
4
*/

SELECT
    COUNT(worker_id) AS n_admins
FROM worker
WHERE department = 'Admin' AND
    MONTH(joining_date) >= 4;
