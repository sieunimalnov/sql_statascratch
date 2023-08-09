/*
Find the average number of bathrooms and bedrooms for each city’s property types. Output the result along with the city name and the property type.

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

city	property_type	n_bathrooms_avg	n_bedrooms_avg
NYC	Apartment	1.117	1.25
LA	Cabin	3	1
SF	House	1.4	1.8
LA	Villa	2.067	2.533
LA	House	1.5	1.559
*/

SELECT
    city,
    property_type,
    AVG(bathrooms) AS avg_bath,
    AVG(bedrooms) AS avg_bed
FROM airbnb_search_details
GROUP BY city, property_type
