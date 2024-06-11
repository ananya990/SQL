/* Table : Employee
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |
+-------------+---------+
id is the unique primary key for this table.
Each row indicates an employee's ID, name, salary, and manager's ID.
 
Write a solution to find the employees who earn more than their managers. */

SELECT e1.name AS employee
FROM Employee e1
JOIN Employee e2 ON e1.managerId = e2.id
WHERE e1.salary > e2.salary;
