/*
ind the last time each bike was in use. Output both the bike number and the date-timestamp of the bike's last use (i.e., the date-time the bike was returned). Order the results by bikes that were most recently used.

Table: dc_bikeshare_q1_2012
duration:
varchar
duration_seconds:
int
start_time:
datetime
start_station:
varchar
start_terminal:
int
end_time:
datetime
end_station:
varchar
end_terminal:
int
bike_number:
varchar
rider_type:
varchar
id:
int

bike_number	last_used
W01278	2012-03-31 19:28:00
W01097	2012-03-31 15:37:00
W00270	2012-03-31 12:10:00
W01006	2012-03-31 10:44:00
W01242	2012-03-31 09:24:00
*/

SELECT
    bike_number,
    MAX(end_time) AS last_used
FROM dc_bikeshare_q1_2012
GROUP BY bike_number
ORDER BY last_used DESC;
