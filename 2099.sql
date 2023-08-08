/*
The election is conducted in a city and everyone can vote for one or more candidates, or choose not to vote at all. Each person has 1 vote so if they vote for multiple candidates, their vote gets equally split across these candidates. For example, if a person votes for 2 candidates, these candidates receive an equivalent of 0.5 vote each.
Find out who got the most votes and won the election. Output the name of the candidate or multiple names in case of a tie. To avoid issues with a floating-point error you can round the number of votes received by a candidate to 3 decimal places.

Table: voting_results
voter:
varchar
candidate:
varchar

candidate
Christine 
*/

WITH wb1 AS (
SELECT
    voter,
    candidate
FROM voting_results
WHERE candidate IS NOT NULL
),
wb2 AS (
SELECT
    voter,
    candidate,
    ROUND(1.0 / (
        SELECT COUNT(candidate)
        FROM wb1 AS v1
        WHERE v1.voter = v2.voter
        GROUP BY v1.voter
    ), 3) AS votes
FROM wb1 AS v2
),
wb3 AS (
SELECT
    candidate,
    SUM(votes) AS votes
FROM wb2
GROUP BY candidate
),
wb4 AS (
SELECT
    candidate,
    votes,
    DENSE_RANK() OVER(ORDER BY votes DESC) AS rnk
FROM wb3
)
SELECT candidate
FROM wb4
WHERE rnk = 1;
