/*
Count the number of movies that Abigail Breslin was nominated for an oscar.

Table: oscar_nominees
year:
int
category:
varchar
nominee:
varchar
movie:
varchar
winner:
bool
id:
int

n_movies_by_abi
1
*/

SELECT COUNT(movie) AS n_movies_by_abi
FROM oscar_nominees
WHERE UPPER(nominee) LIKE UPPER('abigail breslin');
