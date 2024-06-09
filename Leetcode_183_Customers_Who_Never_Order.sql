/* Table : Customers             Table: Orders
+-------------+---------+        +-------------+------+
| Column Name | Type    |        | Column Name | Type | 
+-------------+---------+        +-------------+------+
| id          | int     |        | id          | int  | 
| name        | varchar |        | customerId  | int  |
+-------------+---------+        +-------------+------+
                  
 Write a solution to find all customers who never order anything. */

SELECT name AS Customers 
FROM Customers
WHERE id NOT IN (SELECT customerId FROM Orders);

/* OR */

SELECT c.name as Customers
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.id IS NULL;
