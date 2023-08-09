/*
Find the most profitable company from the financial sector. Output the result along with the continent.

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

company	continent
ICBC	Asia
*/

SELECT
    company,
    continent
FROM forbes_global_2010_2014
WHERE profits = (
    SELECT MAX(profits)
    FROM forbes_global_2010_2014
    WHERE sector = 'Financials'
    );
