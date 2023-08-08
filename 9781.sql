/*
Find the rate of processed tickets for each type.

Table: facebook_complaints
complaint_id:
int
type:
int
processed:
bool


type	processed_rate
0	0.667
1	0.667
*/

SELECT
    type,
    AVG(processed) AS processed_rate
FROM facebook_complaints
GROUP BY type;
