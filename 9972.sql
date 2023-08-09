/*
Find the base pay for Police Captains.
Output the employee name along with the corresponding base pay.

Table: sf_public_salaries
id:
int
employeename:
varchar
jobtitle:
varchar
basepay:
float
overtimepay:
float
otherpay:
float
benefits:
float
totalpay:
float
totalpaybenefits:
float
year:
int
notes:
datetime
agency:
varchar
status:
varchar

employeename	basepay
PATRICIA JACKSON	99722
TERESA BARRETT	188328.08
ANNA BROWN	102571.24
DOUGLAS MCEACHERN	194566.01
JOHN LOFTUS	188341.62
*/

SELECT
    employeename,
    basepay
FROM sf_public_salaries
WHERE jobtitle LIKE '%captain%';
