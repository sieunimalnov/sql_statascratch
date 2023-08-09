/*
Find the number of times each word appears in drafts.
Output the word along with the corresponding number of occurrences.

Table: google_file_store
filename:
varchar
contents:
varchar

word	nentry
The	2
stock	2
exchange	2
predicts	2
a	3
*/

WITH RECURSIVE wb1 AS (
SELECT 1 AS i
UNION ALL
SELECT (i + 1)
FROM wb1
WHERE i < (
    SELECT
        MAX(CHAR_LENGTH(TRIM(contents)) - 
            CHAR_LENGTH(REPLACE(TRIM(contents), ' ', '')) + 1)
    FROM google_file_store
    WHERE filename REGEXP '^draft'
    )
),
wb2 AS (
SELECT i
FROM wb1
),
wb3 AS (
SELECT 
    REGEXP_REPLACE(TRIM(contents), '[^a-zA-Z0-9 ]', '') AS contents,
    i
FROM google_file_store
INNER JOIN wb2
WHERE filename REGEXP '^draf' AND
    i <= (CHAR_LENGTH(TRIM(contents)) - CHAR_LENGTH(REPLACE(TRIM(contents), ' ', '')) + 1)
)
SELECT
    SUBSTRING_INDEX(SUBSTRING_INDEX(contents, ' ', i), ' ', -1) AS word,
    COUNT(SUBSTRING_INDEX(SUBSTRING_INDEX(contents, ' ', i), ' ', -1)) AS nentry
FROM wb3
GROUP BY SUBSTRING_INDEX(SUBSTRING_INDEX(contents, ' ', i), ' ', -1);
