/*
You’re given a dataset of uber rides with the traveling distance (‘distance_to_travel’) and cost (‘monetary_cost’) for each ride. For each date, find the difference between the distance-per-dollar for that date and the average distance-per-dollar for that year-month. Distance-per-dollar is defined as the distance traveled divided by the cost of the ride.


The output should include the year-month (YYYY-MM) and the absolute average difference in distance-per-dollar (Absolute value to be rounded to the 2nd decimal).
You should also count both success and failed request_status as the distance and cost values are populated for all ride requests. Also, assume that all dates are unique in the dataset. Order your results by earliest request date first.

uber_request_logs
Preview
request_id:
int
request_date:
datetime
request_status:
varchar
distance_to_travel:
float
monetary_cost:
float
driver_to_client_distance:
float

request_mnth	difference
2020-01	3.32
2020-02	1.58
2020-03	3.13
2020-04	1.19
2020-05	6.44
*/

WITH wb1 AS (
SELECT
    request_date,
    distance_to_travel / monetary_cost AS distance_per_dollar,
    (SELECT AVG(distance_to_travel / monetary_cost)
        FROM uber_request_logs AS uber2
        WHERE MONTH(uber2.request_date) = MONTH(uber1.request_date)
    ) AS avg_distance_per_dollar
FROM uber_request_logs AS uber1
)
SELECT
    DATE_FORMAT(request_date, '%Y-%m') AS request_month,
    ROUND(AVG(ABS(distance_per_dollar - avg_distance_per_dollar)), 2) AS difference
FROM wb1
GROUP BY DATE_FORMAT(request_date, '%Y-%m')
ORDER BY request_month ASC;
