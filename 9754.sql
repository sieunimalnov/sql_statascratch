/*
Find the best actors/actresses of all time based on the number of Oscar awards. Output nominees alongside their number of Oscars. Order records in descending order based on the number of awards.

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

nominee	n_occurences
Christoph Waltz	2
Sean Penn	2
Daniel Day-Lewis	2
Nicole Kidman	1
Jamie Foxx	1
*/

SELECT
    nominee,
    SUM(winner) AS n_oscars
FROM oscar_nominees
GROUP BY nominee
HAVING SUM(winner) > 0
ORDER BY n_oscars DESC;
