/*
You have a table of in-app purchases by user. Users that make their first in-app purchase are placed in a marketing campaign where they see call-to-actions for more in-app purchases. Find the number of users that made additional in-app purchases due to the success of the marketing campaign.


The marketing campaign doesn't start until one day after the initial in-app purchase so users that only made one or multiple purchases on the first day do not count, nor do we count users that over time purchase only the products they purchased on the first day.

Table: marketing_campaign
user_id:
int
created_at:
datetime
product_id:
int
quantity:
int
price:
int

count(DISTINCT user_id)
23
*/

WITH wb1 AS (
SELECT
    user_id,
    created_at,
    product_id,
    DENSE_RANK() OVER(PARTITION BY user_id ORDER BY created_at ASC) AS pur_day
FROM marketing_campaign
)
SELECT
    COUNT(DISTINCT user_id)
FROM wb1 AS t1
WHERE pur_day > 1 AND product_id NOT IN (
    SELECT
        product_id
    FROM wb1 AS t2
    WHERE pur_day = 1 AND t1.user_id = t2.user_id
    );
