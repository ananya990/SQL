/* Table : Courses
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| student     | varchar |
| class       | varchar |
+-------------+---------+
(student, class) is the composite primary key for this table.
Each row indicates the student's name and their enrolled class.

Write a solution to find all the classes that have at least five students. */

SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;
