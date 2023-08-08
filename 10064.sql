/*
Find the date with the highest total energy consumption from the Meta/Facebook data centers. Output the date along with the total energy consumption across all data centers.

Tables: fb_eu_energy, fb_asia_energy, fb_na_energy
fb_eu_energy
Preview
date:
datetime
consumption:
int
fb_asia_energy
Preview
date:
datetime
consumption:
int
fb_na_energy
Preview
date:
datetime
consumption:
int

date	consumption
2020-01-07	1250
2020-01-06	1250
*/

WITH wb1 AS (
SELECT
    date,
    consumption
FROM fb_eu_energy
UNION ALL
SELECT
    date,
    consumption
FROM fb_asia_energy
UNION ALL
SELECT
    date,
    consumption
FROM fb_na_energy
),
wb2 AS (
SELECT
    date,
    SUM(consumption) AS total_con,
    (SELECT consumption FROM fb_eu_energy AS eu WHERE eu.date = wb1.date) AS eu_energy,
    (SELECT consumption FROM fb_asia_energy AS a WHERE a.date = wb1.date) AS a_energy,
    (SELECT consumption FROM fb_na_energy AS na WHERE na.date = wb1.date) AS na_energy
FROM wb1
GROUP BY date
ORDER BY total_con DESC
)
SELECT
    date,
    total_con AS consumption
FROM wb2
WHERE total_con = (SELECT MAX(total_con) FROM wb2);
