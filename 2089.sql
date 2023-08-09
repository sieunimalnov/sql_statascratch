/*
You are given the table with titles of recipes from a cookbook and their page numbers. You are asked to represent how the recipes will be distributed in the book.
Produce a table consisting of three columns: left_page_number, left_title and right_title. The k-th row (counting from 0), should contain the number and the title of the page with the number 
2
×
�
2×k in the first and second columns respectively, and the title of the page with the number 
2
×
�
+
1
2×k+1 in the third column.
Each page contains at most 1 recipe. If the page does not contain a recipe, the appropriate cell should remain empty (NULL value). Page 0 (the internal side of the front cover) is guaranteed to be empty.

Table: cookbook_titles
page_number:
int
title:
varchar

left_page_number	left_title	right_title
0		Scrambled eggs
2	Fondue	Sandwich
4	Tomato soup	
6	Liver	
8		
*/

WITH RECURSIVE wb1 AS (
SELECT 0 AS i
UNION ALL
SELECT (i + 1)
FROM wb1
WHERE i < (SELECT MAX(page_number) FROM cookbook_titles)
),
wb2 AS (
SELECT
    i AS left_p,
    (i + 1) right_p
FROM wb1
)
SELECT
    left_p AS left_page_number,
    (SELECT title
        FROM cookbook_titles AS c1
        WHERE c1.page_number = wb2.left_p
    ) AS left_title,
    (SELECT title
        FROM cookbook_titles AS c2
        WHERE c2.page_number = wb2.right_p
    ) AS right_title
FROM wb2
WHERE MOD(right_p, 2.0) != 0;
