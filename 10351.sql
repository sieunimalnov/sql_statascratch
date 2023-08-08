/*
Find the email activity rank for each user. Email activity rank is defined by the total number of emails sent. The user with the highest number of emails sent will have a rank of 1, and so on. Output the user, total emails, and their activity rank. Order records by the total emails in descending order. Sort users with the same number of emails in alphabetical order.
In your rankings, return a unique value (i.e., a unique rank) even if multiple users have the same number of emails. For tie breaker use alphabetical order of the user usernames.

Table: google_gmail_emails
id:
int
from_user:
varchar
to_user:
varchar
day:
int

from_user	total_emails	ROW_NUMBER() OVER(ORDER BY count(*) DESC, from_user ASC)
32ded68d89443e808	19	1
ef5fe98c6b9f313075	19	2
5b8754928306a18b68	18	3
55e60cfcc9dc49c17e	16	4
91f59516cb9dee1e88	16	5
*/

WITH wb1 As (
SELECT
    from_user,
    COUNT(to_user) AS total_emails
FROM google_gmail_emails
GROUP BY from_user
)
SELECT
    from_user,
    total_emails,
    ROW_NUMBER() OVER(ORDER BY total_emails DESC, from_user ASC) AS activity_rank
FROM wb1;
