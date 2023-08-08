/*
For each video, find how many unique users flagged it. A unique user can be identified using the combination of their first name and last name. Do not consider rows in which there is no flag ID.

user_firstname:
varchar
user_lastname:
varchar
video_id:
varchar
flag_id:
varchar

video_id	num_unique_users
5qap5aO4i9A	2
Ct6BUPvE2sM	2
dQw4w9WgXcQ	5
jNQXAC9IVRw	3
y6120QOlsfU	5
*/

SELECT
    video_id,
    COUNT(DISTINCT CONCAT(COALESCE(user_firstname, ' '), 
        COALESCE(user_lastname, ' '))) AS num_unique_users
FROM user_flags
WHERE flag_id IS NOT NULL
GROUP BY video_id
