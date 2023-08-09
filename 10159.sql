/*
Rank guests based on the number of messages they've exchanged with the hosts. Guests with the same number of messages as other guests should have the same rank. Do not skip rankings if the preceding rankings are identical.
Output the rank, guest id, and number of total messages they've sent. Order by the highest number of total messages first.

Table: airbnb_contacts
id_guest:
varchar
id_host:
varchar
id_listing:
varchar
ts_contact_at:
datetime
ts_reply_at:
datetime
ts_accepted_at:
datetime
ts_booking_at:
datetime
ds_checkin:
datetime
ds_checkout:
datetime
n_guests:
int
n_messages:
int

id_guest	ranks	messages
62d09c95-c3d2-44e6-9081-a3485618227d	1	20
882f3764-05cc-436a-b23b-93fea22ea847	1	20
91c2a883-04e3-4bbb-a7bb-620531318ab1	2	17
b8831610-31f2-4c58-8ada-63b3601ca476	2	17
6133fb99-2391-4d4b-a077-bae40581f925	3	16
*/

WITH wb1 AS (
SELECT
    id_guest,
    SUM(n_messages) AS n_messages
FROM airbnb_contacts
GROUP BY id_guest
)
SELECT
    id_guest,
    DENSE_RANK() OVER (ORDER BY n_messages DESC) AS ranks,
    n_messages
FROM wb1;
