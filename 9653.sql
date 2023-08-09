/*
Count the number of user events performed by MacBookPro users.
Output the result along with the event name.
Sort the result based on the event count in the descending order.

Table: playbook_events
user_id:
int
occurred_at:
datetime
event_type:
varchar
event_name:
varchar
location:
varchar
device:
varchar

event_name	event_count
home_page	8
view_inbox	3
login	3
search_autocomplete	3
like_message	3
*/

SELECT
    event_name,
    COUNT(event_name) AS event_count
FROM playbook_events
WHERE device REGEXP '^macbook.pro$'
GROUP BY event_name;
