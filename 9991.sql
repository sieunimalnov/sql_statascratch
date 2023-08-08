/*
Find songs that have ranked in the top position. Output the track name and the number of times it ranked at the top. Sort your records by the number of times the song was in the top position in descending order.

Table: spotify_worldwide_daily_song_ranking
id:
int
position:
int
trackname:
varchar
artist:
varchar
streams:
int
url:
varchar
date:
datetime
region:
varchar

trackname	times_top1
HUMBLE.	7
Bad and Boujee (feat. Lil Uzi Vert)	1
Look What You Made Me Do	1
*/

SELECT
    trackname,
    COUNT(position) AS times_top1
FROM spotify_worldwide_daily_song_ranking
WHERE position = 1
GROUP BY trackname
ORDER BY times_top1 DESC;
