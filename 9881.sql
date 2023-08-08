/*
Make a report showing the number of survivors and non-survivors by passenger class.
Classes are categorized based on the pclass value as:
pclass = 1: first_class
pclass = 2: second_classs
pclass = 3: third_class
Output the number of survivors and non-survivors by each class.

Table: titanic
passengerid:
int
survived:
int
pclass:
int
name:
varchar
sex:
varchar
age:
float
sibsp:
int
parch:
int
ticket:
varchar
fare:
float
cabin:
varchar
embarked:
varchar

survived	first_class	second_class	third_class
0	11	6	42
1	10	12	19
*/

SELECT
    survived,
    SUM(CASE WHEN pclass = 1 THEN 1 END) AS first_class,
    SUM(CASE WHEN pclass = 2 THEN 1 END) AS second_class,
    SUM(CASE WHEN pclass = 3 THEN 1 END) AS third_class
FROM titanic
GROUP BY survived
