/*
Find all Lyft drivers who earn either equal to or less than 30k USD or equal to or more than 70k USD.
Output all details related to retrieved records.

Table: lyft_drivers
index:
int
start_date:
datetime
end_date:
datetime
yearly_salary:
int

index	start_date	end_date	yearly_salary
10	2018-04-25	2018-04-28	79536
14	2015-11-30	2018-04-24	89270
15	2018-05-29		87766
17	2017-05-07		88828
18	2018-11-09		82993
*/

SELECT *
FROM lyft_drivers
WHERE yearly_salary <= 30000 OR yearly_salary >= 70000;
