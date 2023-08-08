/*
You have been asked to find the job titles of the highest-paid employees.


Your output should include the highest-paid title or multiple titles with the same salary.

Tables: worker, title
worker
Preview
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
title
Preview
worker_ref_id:
int
worker_title:
varchar
affected_from:
datetime

best_paid_title
Asst. Manager
Manager
*/

SELECT
    worker_title AS best_paid_title
FROM worker
INNER JOIN title
ON worker.worker_id = title.worker_ref_id
WHERE salary = (SELECT MAX(salary) FROM worker)
ORDER BY best_paid_title ASC;
