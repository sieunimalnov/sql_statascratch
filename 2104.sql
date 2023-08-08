/*
Which user flagged the most distinct videos that ended up approved by YouTube? Output, in one column, their full name or names in case of a tie. In the user's full name, include a space between the first and the last name.

Tables: user_flags, flag_review
user_flags
Preview
user_firstname:
varchar
user_lastname:
varchar
video_id:
varchar
flag_id:
varchar
flag_review
Preview
flag_id:
varchar
reviewed_by_yt:
bool
reviewed_date:
datetime
reviewed_outcome:
varchar

username
Mark May
Richard Hasson
*/

WITH wb1 AS (
SELECT
    CONCAT(IFNULL(user_firstname, ''), ' ', IFNULL(user_lastname, '')) AS full_name,
    video_id
FROM user_flags
INNER JOIN flag_review
USING(flag_id)
WHERE reviewed_outcome = 'APPROVED'
),
wb2 AS (
SELECT
    full_name,
    COUNT(DISTINCT video_id) AS video_count
FROM wb1
GROUP BY full_name
)
SELECT full_name AS username
FROM wb2
WHERE video_count = (
    SELECT MAX(video_count) FROM wb2
);
