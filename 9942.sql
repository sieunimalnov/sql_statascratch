/*
Find the Olympics with the highest number of athletes. The Olympics game is a combination of the year and the season, and is found in the 'games' column. Output the Olympics along with the corresponding number of athletes.

Table: olympics_athletes_events
id:
int
name:
varchar
sex:
varchar
age:
float
height:
float
weight:
datetime
team:
varchar
noc:
varchar
games:
varchar
year:
int
season:
varchar
city:
varchar
sport:
varchar
event:
varchar
medal:
varchar

games	athletes_count
1924 Summer	118
*/

SELECT
    games,
    COUNT(DISTINCT id) AS athletes_count
FROM olympics_athletes_events
GROUP BY games
ORDER BY athletes_count DESC
LIMIT 1;
