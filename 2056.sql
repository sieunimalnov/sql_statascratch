/*
Write a query that will calculate the number of shipments per month. The unique key for one shipment is a combination of shipment_id and sub_id. Output the year_month in format YYYY-MM and the number of shipments in that month.

Table: amazon_shipment
shipment_id:
int
sub_id:
int
weight:
int
shipment_date:
datetime

count(shipment_id)	date_ym
3	2021-08
6	2021-09
*/

SELECT
    COUNT(CONCAT(shipment_id, sub_id)) AS num_shipments,
    DATE_FORMAT(shipment_date, '%Y-%m') AS yrmnth
FROM amazon_shipment
GROUP BY DATE_FORMAT(shipment_date, '%Y-%m');
