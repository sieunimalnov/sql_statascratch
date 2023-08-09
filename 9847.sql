/*
Find the number of workers by department who joined in or after April.


Output the department name along with the corresponding number of workers.


Sort records based on the number of workers in descending order.

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

department	num_workers
Admin	4
Account	1
HR	1
*/

SELECT
    department,
    COUNT(worker_id) AS num_workers
FROM worker
WHERE MONTH(joining_date) >= 4
GROUP BY department
ORDER BY num_workers DESC;
