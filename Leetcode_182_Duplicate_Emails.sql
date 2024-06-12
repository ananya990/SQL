/* Table : Person
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the table's primary key (unique values).
Each row contains a lowercase email.
 
Write a solution to report all the duplicate emails. 
Note that it's guaranteed that the email field is not NULL. */

select distinct p1.email
from Person p1
join Person p2 on p1.email=p2.email
where p1.email=p2.email AND p1.id!=p2.id;

/* OR */

SELECT email
FROM Person
GROUP BY email
HAVING COUNT(email) > 1;

/* OR */

WITH email_counts AS (
    SELECT email, COUNT(*) AS email_count 
    FROM Person 
    GROUP BY email
)
SELECT email AS Email 
FROM email_counts 
WHERE email_count > 1;
