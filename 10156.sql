/*
Find the number of apartments per nationality that are owned by people under 30 years old.


Output the nationality along with the number of apartments.


Sort records by the apartments count in descending order.

Tables: airbnb_hosts, airbnb_units
airbnb_hosts
Preview
host_id:
int
nationality:
varchar
gender:
varchar
age:
int
airbnb_units
Preview
host_id:
int
unit_id:
varchar
unit_type:
varchar
n_beds:
int
n_bedrooms:
int
country:
varchar
city:
varchar

nationality	apartment_count
USA	2
*/

WITH wb1 AS (
SELECT DISTINCT
    nationality,
    unit_id
FROM airbnb_hosts AS hst
INNER JOIN airbnb_units AS unt
ON hst.host_id = unt.host_id
WHERE hst.age < 30 AND unit_type = 'Apartment'
)
SELECT
    nationality,
    COUNT(unit_id) AS apartment_count
FROM wb1
GROUP BY nationality
ORDER BY apartment_count DESC;
