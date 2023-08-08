/*
What were the top 10 ranked songs in 2010?
Output the rank, group name, and song name but do not show the same song twice.
Sort the result based on the year_rank in ascending order.

Table: billboard_top_100_year_end
year:
int
year_rank:
int
group_name:
varchar
artist:
varchar
song_name:
varchar
id:
int

song_name	group_name	year_rank
TiK ToK	Ke$ha	1
Need You Now	Lady Antebellum	2
Hey, Soul Sister	Train	3
California Gurls	Katy Perry feat. Snoop Dogg	4
OMG	Usher feat. will.i.am	5
*/

SELECT DISTINCT
    song_name,
    group_name,
    year_rank
FROM billboard_top_100_year_end
WHERE year = 2010 AND year_rank <= 10
ORDER BY year_rank ASC;
