/*
You are given a table of product launches by company by year. Write a query to count the net difference between the number of products companies launched in 2020 with the number of products companies launched in the previous year. Output the name of the companies and a net difference of net products released for 2020 compared to the previous year.

Table: car_launches
year:
int
company_name:
varchar
product_name:
varchar

company_name	total_launch
Toyota	-1
Honda	-3
Chevrolet	2
Ford	-1
Jeep	1
*/

SELECT
    company_name,
    (COUNT(CASE WHEN year = 2020 THEN product_name END) -
        COUNT(CASE WHEN year = 2019 THEN product_name END)) AS total_launches
FROM car_launches
GROUP BY company_name;
