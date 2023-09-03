/*
Find the average rating of each movie star along with their names and birthdays. Sort the result in the ascending order based on the birthday. Use the names as keys when joining the tables.

nominee_filmography
Preview
name:
varchar
amg_movie_id:
varchar
movie_title:
varchar
role_type:
varchar
rating:
float
year:
int
id:
int
nominee_information
Preview
name:
varchar
amg_person_id:
varchar
top_genre:
varchar
birthday:
datetime
id:
int

birthday	name	avg_rating
1924-10-27	Ruby Dee	1
1925-02-17	Hal Holbrook	7
1926-04-30	Cloris Leachman	2.5
1930-09-19	Rosemary Harris	6
1931-06-20	Martin Landau	7
*/

SELECT
    star.birthday,
    film.name,
    AVG(film.rating) AS avg_rating
FROM nominee_filmography AS film
INNER JOIN nominee_information AS star
ON film.name = star.name
GROUP BY film.name, star.birthday
ORDER BY star.birthday ASC;
