/*
ind the 3 most profitable companies in the entire world.
Output the result along with the corresponding company name.
Sort the result based on profits in descending order.

Table: forbes_global_2010_2014
company:
varchar
sector:
varchar
industry:
varchar
continent:
varchar
country:
varchar
marketvalue:
float
sales:
float
profits:
float
assets:
float
rank:
int
forbeswebpage:
varchar

All required columns and the first 5 rows of the solution are shown

company	profits
ICBC	42.7
Gazprom	39
Apple	37
*/

# select * from forbes_global_2010_2014;

WITH wb1 AS (
SELECT
    company,
    profits,
    DENSE_RANK() OVER(ORDER BY profits DESC) AS rnk
FROM forbes_global_2010_2014
)
SELECT
    company,
    profits
FROM wb1
WHERE rnk <= 3
ORDER BY profits DESC;
