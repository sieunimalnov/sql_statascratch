/*
Find libraries who haven't provided the email address in circulation year 2016 but their notice preference definition is set to email.
Output the library code.

Table: library_usage
patron_type_code:
int
patron_type_definition:
varchar
total_checkouts:
int
total_renewals:
int
age_range:
varchar
home_library_code:
varchar
home_library_definition:
varchar
circulation_active_month:
varchar
circulation_active_year:
float
notice_preference_code:
varchar
notice_preference_definition:
varchar
provided_email_address:
bool
year_patron_registered:
int
outside_of_county:
bool
supervisor_district:
float

home_library_code
X
R3
P7
E9
*/

SELECT DISTINCT
    home_library_code
FROM library_usage
WHERE provided_email_address = 0 AND
    circulation_active_year = 2016 AND
    notice_preference_definition = 'email';
