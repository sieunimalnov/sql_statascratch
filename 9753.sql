/*
Find movies that had the most nominated actors/actresses. Be aware of the fact that some movies have the same name. Use the year column to separate count for such movies.
Output the movie name alongside the number of nominees.
Order the result in descending order.

oscar_nominees
Preview
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

movie	n_occurrences
Chicago	4
Doubt	4
Silver Linings Playbook	4
Adaptation	3
Brokeback Mountain	3
*/

SELECT
    movie,
    COUNT(nominee) AS n_nominees
FROM oscar_nominees
GROUP BY movie, year
ORDER BY n_nominees DESC;
