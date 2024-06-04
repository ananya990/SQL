/* Table : Customer
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| referee_id  | int     |
+-------------+---------+
id is the primary key column for this table. Each row of this table indicates 
id of a customer, their name, and the id of the customer who referred them.
 
Find the names of the customer that are not referred by the customer with id = 2. */

SELECT name
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL;
