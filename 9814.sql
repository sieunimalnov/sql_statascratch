/*
Find the number of times the words 'bull' and 'bear' occur in the contents. We're counting the number of times the words occur so words like 'bullish' should not be included in our count.
Output the word 'bull' and 'bear' along with the corresponding number of occurrences.

Table: google_file_store
filename:
varchar
contents:
varchar

word	count
bull	3
bear	2
*/

WITH wb1 AS (
SELECT
    REGEXP_REPLACE(contents, '(^bull )|( bull )|( bull$)', 1) AS bull,
    REGEXP_REPLACE(contents, '(^bear )|( bear )|( bear$)', 1) AS bear
FROM google_file_store
),
wb2 AS (
SELECT
    SUM(CHAR_LENGTH(bull) - CHAR_LENGTH(REPLACE(bull, '1', ''))) AS bull,
    SUM(CHAR_LENGTH(bear) - CHAR_LENGTH(REPLACE(bear, '1', ''))) AS bear
FROM wb1
)
SELECT 'bull' AS word, bull AS count
FROM wb2
UNION ALL
SELECT 'bear', bear
FROM wb2;
