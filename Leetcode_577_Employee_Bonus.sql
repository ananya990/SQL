/* Table: Employee                        Table: Bonus
+-------------+---------+                 +-------------+------+
| empId       | int     |                 | empId       | int  |
| name        | varchar |                 | bonus       | int  |
| supervisor  | int     |                 +-------------+------+
| salary      | int     |                 empId is the unique identifier for this table.
+-------------+---------+                 empId in Bonus references empId in Employee.
empId - Primary Key

Write a solution to report the name and bonus amount of each employee with a bonus less than 1000. */

SELECT E.name, B.bonus
FROM Employee E
LEFT JOIN Bonus B ON E.empId = B.empId
WHERE B.bonus < 1000 OR B.bonus IS NULL;
