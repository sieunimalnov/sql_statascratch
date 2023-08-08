/*
Find the total number of downloads for paying and non-paying users by date. Include only records where non-paying customers have more downloads than paying customers. The output should be sorted by earliest date first and contain 3 columns date, non-paying downloads, paying downloads.

Tables: ms_user_dimension, ms_acc_dimension, ms_download_facts
user_id:
int
acc_id:
int
ms_acc_dimension
Preview
acc_id:
int
paying_customer:
varchar
ms_download_facts
Preview
date:
datetime
user_id:
int
downloads:
int

date	non_paying	paying
2020-08-16	15	14
2020-08-17	45	9
2020-08-18	10	7
2020-08-21	32	17
*/

WITH wb1 AS (
SELECT
    dwn.date,
    SUM(CASE WHEN pay.paying_customer = 'no' THEN dwn.downloads END) AS unpaid,
    SUM(CASE WHEN pay.paying_customer = 'yes' THEN dwn.downloads END) AS paid
FROM ms_user_dimension AS usr
INNER JOIN ms_acc_dimension AS pay
ON usr.acc_id = pay.acc_id
INNER JOIN ms_download_facts AS dwn
ON usr.user_id = dwn.user_id
GROUP BY dwn.date
ORDER BY date ASC
)
SELECT
    date,
    unpaid AS non_paying,
    paid AS paying
FROM wb1
WHERE unpaid > paid;
