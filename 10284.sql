/*
Find the popularity percentage for each user on Meta/Facebook. The popularity percentage is defined as the total number of friends the user has divided by the total number of users on the platform, then converted into a percentage by multiplying by 100.
Output each user along with their popularity percentage. Order records in ascending order by user id.
The 'user1' and 'user2' column are pairs of friends.

Table: facebook_friends
user1:
int
user2:
int

user1	popularity_percent
1	55.556
2	33.333
3	33.333
4	11.111
5	11.111
*/

WITH wb1 AS (
(SELECT
    user1 AS user,
    COUNT(user2) AS friends
FROM facebook_friends
GROUP BY user1)
UNION ALL
(SELECT
    user2,
    COUNT(user1)
FROM facebook_friends
GROUP BY user2)
),
wb2 AS (
SELECT
    user,
    SUM(friends) AS friends
FROM wb1
GROUP BY user
)
SELECT
    user AS user1,
    (100 * friends / (SELECT COUNT(user) FROM wb2)) AS popularity_percent
FROM wb2
ORDER BY user1 ASC;
