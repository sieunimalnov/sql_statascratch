/*
Find the top 5 states with the most 5 star businesses. Output the state name along with the number of 5-star businesses and order records by the number of 5-star businesses in descending order. In case there are ties in the number of businesses, return all the unique states. If two states have the same result, sort them in alphabetical order.

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

state	five_star_counts
AZ	10
ON	5
NV	4
IL	3
OH	3
*/

WITH wb1 AS (
SELECT
    state,
    COUNT(stars) AS n_5star
FROM yelp_business
WHERE stars = 5
GROUP BY state
),
wb2 AS (
SELECT
    state,
    n_5star,
    RANK() OVER(ORDER BY n_5star DESC) AS rnk
FROM wb1
)
SELECT
    state,
    n_5star AS five_star_count
FROM wb2
WHERE rnk <= 5
ORDER BY five_star_count DESC, state ASC;
