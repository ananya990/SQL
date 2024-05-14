/* In the scenario described, the task of calculating average monthly salaries for employees 
was undertaken. However, a malfunctioning '0' key led to the exclusion of zeros in the computation. 
Now, assistance is sought to find the difference between the miscalculation and 
the actual average salary, rounded up to the nearest integer. 

Table: EMPLOYEES
+--------------+--------------+
| Field        | Type         |
+--------------+--------------+
| ID           | Integer      |
| Name         | String       |
| Salary       | Integer      |
+--------------+--------------+  */

SELECT CEIL((SUM(salary) - SUM(REPLACE(salary, '0', ''))) / COUNT(*))
FROM EMPLOYEES;

/* Explanation:
Wrong Table                         Actual Table
+----+---------+--------+           +----+---------+--------+
| ID | Name    | Salary |           | ID | Name    | Salary |
+----+---------+--------+           +----+---------+--------+
| 1  | Kristeen| 142    |           | 1  | Kristeen| 1420   |
| 2  | Ashley  | 26     |           | 2  | Ashley  | 2006   |
| 3  | Julia   | 221    |           | 3  | Julia   | 2210   |
| 4  | Maria   | 3      |           | 4  | Maria   | 3000   |
+----+---------+--------+           +----+---------+--------+

By mistake, an average salary of 98.00 is computed. The actual average salary is 2159.00.
The resulting error between the two calculations is 2159.00 - 98.00 = 2061.00.
Since it is equal to the integer 2061, it does not get rounded up. */
