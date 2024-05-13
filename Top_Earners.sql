/* Find the maximum total earnings among employees and 
count the number of employees with that maximum total earnings. 
Each employee's total earnings are calculated by multiplying 
the number of months worked by their monthly salary. 
Return these values as two space-separated integers.

Table : Employee
+--------------+---------+
| Column       | Type    |
+--------------+---------+
| employee_id  | Integer |
| name         | String  |
| months       | Integer |
| salary       | Integer |
+--------------+---------+ */

SELECT 
    months * salary AS total_earnings,
    COUNT(*) AS num_employees
FROM Employee
GROUP BY total_earnings
ORDER BY total_earnings DESC
LIMIT 1;
