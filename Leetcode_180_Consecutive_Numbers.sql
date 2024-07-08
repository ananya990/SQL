/* Table : Logs
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
In SQL, id is the primary key for this table.
id is an autoincrement column.
 
Find all numbers that appear at least three times consecutively. */

SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2 ON l1.id = l2.id + 1
JOIN Logs l3 ON l2.id = l3.id + 1
WHERE l1.num = l2.num AND l2.num = l3.num;

/* OR */

SELECT DISTINCT l1.num AS ConsecutiveNums
FROM logs l1, logs l2, logs l3
WHERE l1.id=l2.id+1 AND l1.num=l2.num AND l1.id=l3.id+2 AND l1.num= l3.num;
