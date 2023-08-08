/*
Find the top 5 businesses with most reviews. Assume that each row has a unique business_id such that the total reviews for each business is listed on each row. Output the business name along with the total number of reviews and order your results by the total reviews in descending order.

Table: yelp_business
business_id:
varchar
name:
varchar
neighborhood:
varchar
address:
varchar
city:
varchar
state:
varchar
postal_code:
varchar
latitude:
float
longitude:
float
stars:
float
review_count:
int
is_open:
int
categories:
varchar

name	review_count
Iron Chef	331
Jacs Dining and Tap House	197
Grimaldi's Pizzeria	187
Signs Restaurant	120
Kassab's	101
*/

Coding Questions
Non-coding Questions
Data Projects
Guides
Blog
Pricing
Profile

Back to Questions
MySQL
Top Businesses With Most Reviews
Question
Your Submissions
Solution Discussion
Solutions from Users
Resources
00:00
Top Businesses With Most Reviews


Yelp
Medium
ID 10048
57

Data Engineer
Data Scientist
BI Analyst
Data Analyst
Find the top 5 businesses with most reviews. Assume that each row has a unique business_id such that the total reviews for each business is listed on each row. Output the business name along with the total number of reviews and order your results by the total reviews in descending order.

Table: yelp_business
Hints
Expected Output
All required columns and the first 5 rows of the solution are shown

name	review_count
Iron Chef	331
Jacs Dining and Tap House	197
Grimaldi's Pizzeria	187
Signs Restaurant	120
Kassab's	101
yelp_business
Preview
business_id:
varchar
name:
varchar
neighborhood:
varchar
address:
varchar
city:
varchar
state:
varchar
postal_code:
varchar
latitude:
float
longitude:
float
stars:
float
review_count:
int
is_open:
int
categories:
varchar
Recommended Medium Interview Questions
ID 10159
Ranking Most Active Guests

ID 2084
Blocked Users

ID 9858
Duplicate HR Department Employees

Recommended Yelp Questions
ID 10049
Reviews of Categories

ID 10060
Top Cool Votes

ID 10056
Cast stars column values to integer and return with all other column values


LIMIT 5;


Run Code
Solved
Use Alt + Enter to run query
Highlight some code to execute selection only

Output
View the output in a separate browser tab
Execution time:
0.03287 seconds
Your Solution:
name	total_review
Iron Chef	331
Jacs Dining and Tap House	197
Grimaldi's Pizzeria	187
Signs Restaurant	120
Kassab's	101

