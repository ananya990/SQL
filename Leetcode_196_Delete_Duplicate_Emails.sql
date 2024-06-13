/* Table : Person
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the table's primary key (unique values).
Each row contains a lowercase email.
 
Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.
For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.

After running your script, the answer shown is the Person table. The driver will first compile and 
run your piece of code and then show the Person table. The final order of the Person table does not matter. */

DELETE p1
FROM Person p1
LEFT JOIN (
    SELECT MIN(id) AS min_id
    FROM Person
    GROUP BY email
) p2 ON p1.id = p2.min_id
WHERE p2.min_id IS NULL;

/* OR */

WITH temp_ids AS (
    SELECT MIN(id) AS id
    FROM person 
    GROUP BY email
)

DELETE FROM person 
WHERE id NOT IN (
    SELECT id FROM temp_ids
);

/* OR */

DELETE FROM PERSON
WHERE id NOT IN (
    SELECT min_id
    FROM (
        SELECT MIN(id) AS min_id
        FROM PERSON
        GROUP BY email
    ) AS subquery
);

/* OR */

DELETE p2
FROM person AS p1
JOIN person p2
ON p1.email = p2.email AND p1.id < p2.id;

/* OR */

DELETE a 
FROM person a, person b 
WHERE a.email = b.email AND a.id > b.id;
