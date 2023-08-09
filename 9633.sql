/*
You're given a dataset of searches for properties on Airbnb. For simplicity, let's say that each search result (i.e., each row) represents a unique host. Find the city with the most amenities across all their host's properties. Output the name of the city.

Table: airbnb_search_details
Unnamed: 0:
int
id:
int
price:
float
property_type:
varchar
room_type:
varchar
amenities:
varchar
accommodates:
int
bathrooms:
int
bed_type:
varchar
cancellation_policy:
varchar
cleaning_fee:
bool
city:
varchar
host_identity_verified:
varchar
host_response_rate:
varchar
host_since:
datetime
neighbourhood:
varchar
number_of_reviews:
int
review_scores_rating:
float
zipcode:
int
bedrooms:
int
beds:
int

city
NYC
*/

WITH RECURSIVE wb1 AS (
SELECT 1 AS i
UNION ALL
SELECT (i+ 1)
FROM wb1
WHERE i < 49
),
wb2 AS (
SELECT
    city,
    REGEXP_REPLACE(TRIM(amenities), '[{}]', '') AS amenities
FROM airbnb_search_details
),
wb3 AS (
SELECT
    city,
    amenities,
    i
FROM wb2
CROSS JOIN wb1
WHERE i <= (CHAR_LENGTH(amenities) - CHAR_LENGTH(REPLACE(amenities, ',', '')) + 1)
)
SELECT
    city
FROM wb3
GROUP BY city
ORDER BY COUNT(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', i), ',', -1)) DESC
LIMIT 1;

/*
statascratch recommended solution
select city from airbnb_search_details
group by city
order by sum(length(amenities)) desc
limit 1
*/
