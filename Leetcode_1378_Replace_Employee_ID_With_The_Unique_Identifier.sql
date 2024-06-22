/* Table : Employees                                Table : EmployeeUNI
+---------------+---------+                         +---------------+---------+
| Column Name   | Type    |                         | Column Name   | Type    |
+---------------+---------+                         +---------------+---------+
| id            | int     |                         | id            | int     |
| name          | varchar |                         | unique_id     | int     |
+---------------+---------+                         +---------------+---------+
id is the primary key.                              (id, unique_id) is the primary key.
Each row of this table contains the id              Each row of this table contains the id and the 
and the name of an employee in a company.           corresponding unique id of an employee in the company.

Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null. */

SELECT eUNI.unique_id, e.name
FROM Employees e
LEFT JOIN EmployeeUNI eUNI ON e.id=eUNI.id;

/* OR */

SELECT eUNI.unique_id, e.name 
FROM Employees e 
LEFT JOIN EmployeeUNI eUNI USING(id);

/* OR */

SELECT ( 
    SELECT unique_id FROM EmployeeUNI
    WHERE id = Employees.id
 ) AS unique_id, name FROM Employees;
