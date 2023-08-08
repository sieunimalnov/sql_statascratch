/*
What is the overall friend acceptance rate by date? Your output should have the rate of acceptances by the date the request was sent. Order by the earliest date to latest.


Assume that each friend request starts by a user sending (i.e., user_id_sender) a friend request to another user (i.e., user_id_receiver) that's logged in the table with action = 'sent'. If the request is accepted, the table logs action = 'accepted'. If the request is not accepted, no record of action = 'accepted' is logged.

Table: fb_friend_requests
user_id_sender:
varchar
user_id_receiver:
varchar
date:
datetime
action:
varchar

date	count(a.user_id_receiver)/count(b.user_id_sender)
2020-01-04	0.75
2020-01-06	0.667
*/

WITH sent AS (
SELECT
    user_id_sender,
    user_id_receiver,
    date AS sent_date
FROM fb_friend_requests
WHERE action = 'sent'
),
accepted AS (
SELECT
    user_id_sender,
    user_id_receiver,
    date AS accept_date
FROM fb_friend_requests
WHERE action = 'accepted'
)
SELECT
    sent_date AS date,
    AVG(CASE WHEN accept_date IS NOT NULL THEN 1 ELSE 0 END) AS acceptance
FROM sent
LEFT JOIN accepted
ON (sent.user_id_sender = accepted.user_id_sender) AND
    (sent.user_id_receiver = accepted.user_id_receiver)
GROUP BY sent_date
ORDER BY date ASC;
