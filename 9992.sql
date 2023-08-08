/*
Find how many times each artist appeared on the Spotify ranking list
Output the artist name along with the corresponding number of occurrences.
Order records by the number of occurrences in descending order.

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

artist	n_occurences
Kendrick Lamar	9
Ed Sheeran	5
Matoma	2
Petit Biscuit	2
Manuel Turizo	2
*/

SELECT
    artist,
    COUNT(id) AS n_occurences
FROM spotify_worldwide_daily_song_ranking
GROUP BY artist
ORDER BY n_occurences DESC;
