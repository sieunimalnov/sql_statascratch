/*
Output ids of students with a median score from the writing SAT.

Table: sat_scores
school:
varchar
teacher:
varchar
student_id:
float
sat_writing:
float
sat_verbal:
float
sat_math:
float
hrs_studied:
float
id:
int
average_sat:
float
love:
datetime

student_id
100
109
113
*/

WITH wb1 AS (
SELECT
    average_sat,
    ROW_NUMBER() OVER(ORDER BY average_sat ASC) AS row_num,
    ((COUNT(average_sat) OVER()) / 2) AS row_mid
FROM sat_scores
),
wb2 AS (
SELECT
    row_num,
    row_mid,
    AVG(average_sat) AS median
FROM wb1
WHERE ((MOD(row_mid, 2.0) = 0) AND
    ((row_num = row_mid) OR (row_num = (row_mid + 1)))) OR
    (row_num = (row_mid + 0.5))
)
SELECT
    student_id
FROM sat_scores
INNER JOIN wb2
ON sat_scores.average_sat = wb2.median;
