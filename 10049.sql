/*
Find the top business categories based on the total number of reviews. Output the category along with the total number of reviews. Order by total reviews in descending order.

Table: yelp_business
business_id:
varchar
name:
varchar
neighborhood:
varchar
address:
varchar
city:
varchar
state:
varchar
postal_code:
varchar
latitude:
float
longitude:
float
stars:
float
review_count:
int
is_open:
int
categories:
varchar

category	review_cnt
Automotive	32
Auto Detailing	4
Restaurants	1703
Event Planning & Services	162
Food Delivery Services	30
*/

WITH RECURSIVE wb2 AS (
SELECT
    1 AS i,
    categories,
    SUBSTRING_INDEX(categories, ';', 1) AS cat,
    review_count
FROM yelp_business
UNION ALL
SELECT
    i + 1,
    categories,
    SUBSTRING_INDEX(SUBSTRING(categories, 2 + LENGTH(SUBSTRING_INDEX(categories, ';', i))), ';', 1),
    review_count
FROM wb2
WHERE SUBSTRING(categories, 2 + LENGTH(SUBSTRING_INDEX(categories, ';', i))) != ''
)
SELECT
    cat AS category,
    SUM(review_count) AS review_cnt
FROM wb2
GROUP BY cat
ORDER BY review_cnt DESC;
