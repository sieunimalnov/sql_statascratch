/*
Find all wineries which produce wines by possessing aromas of plum, cherry, rose, or hazelnut. To make it more simple, look only for singular form of the mentioned aromas. HINT: if one of the specified words is just a substring of another word, this should not be a hit, but a miss.


Example Description: Hot, tannic and simple, with cherry jam and currant flavors accompanied by high, tart acidity and chile-pepper alcohol heat.
Therefore the winery Bella Piazza is expected in the results.

Table: winemag_p1
id:
int
country:
varchar
description:
varchar
designation:
varchar
points:
int
price:
float
province:
varchar
region_1:
varchar
region_2:
varchar
variety:
varchar
winery:
varchar


winery
Boudreaux Cellars
Goldeneye
Pine Ridge
Hopler
Bella Piazza
*/

SELECT
    winery
FROM winemag_p1
WHERE description REGEXP '[^a-zA-Z0-9]plum[^a-zA-Z0-9]' OR
    description REGEXP '[^a-zA-Z0-9]cherry[^a-zA-Z0-9]' OR
    description REGEXP '[^a-zA-Z0-9]rose[^a-zA-Z0-9]' OR
    description REGEXP '[^a-zA-Z0-9]hazelnut[^a-zA-Z0-9]'

/* statascratch recommended code
select distinct winery
FROM winemag_p1
where lower(description) REGEXP '(plum|rose|cherry|hazelnut)([^a-z])'
*/
