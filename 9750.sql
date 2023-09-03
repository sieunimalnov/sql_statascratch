/*
Find the nominee who has won the most Oscars.
Output the nominee's name alongside the result.

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

nominee	n_times_won
Christoph Waltz	2
Sean Penn	2
Daniel Day-Lewis	2
*/

WITH wb1 AS (
SELECT
    nominee,
    SUM(winner) AS n_oscars
FROM oscar_nominees
GROUP BY nominee
)
SELECT
    nominee,
    n_oscars
FROM wb1
WHERE n_oscars = (SELECT MAX(n_oscars) FROM wb1);
