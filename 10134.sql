/*
Calculate the percentage of spam posts in all viewed posts by day. A post is considered a spam if a string "spam" is inside keywords of the post. Note that the facebook_posts table stores all posts posted by users. The facebook_post_views table is an action table denoting if a user has viewed a post.

Tables: facebook_posts, facebook_post_views
acebook_posts
Preview
post_id:
int
poster:
int
post_text:
varchar
post_keywords:
varchar
post_date:
datetime
facebook_post_views
Preview
post_id:
int
viewer_id:
int

post_date	spam_share
2019-01-01	100
2019-01-02	50
*/

SELECT
    post_date,
    (AVG(CASE WHEN UPPER(post_keywords) LIKE UPPER('%spam%') THEN 1 ELSE 0 END) * 100) AS spam
FROM facebook_posts
INNER JOIN facebook_post_views
USING(post_id)
GROUP BY post_date;
