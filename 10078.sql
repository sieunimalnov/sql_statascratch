/*
Find matching hosts and guests pairs in a way that they are both of the same gender and nationality.
Output the host id and the guest id of matched pair.

Tables: airbnb_hosts, airbnb_guests
airbnb_hosts
Preview
host_id:
int
nationality:
varchar
gender:
varchar
age:
int
airbnb_guests
Preview
guest_id:
int
nationality:
varchar
gender:
varchar
age:
int

host_id	guest_id
0	9
1	5
2	1
3	7
4	0
*/

SELECT DISTINCT
    host_id,
    guest_id
FROM airbnb_hosts AS hst
INNER JOIN airbnb_guests AS gst
ON hst.nationality = gst.nationality AND
    hst.gender = gst.gender;
