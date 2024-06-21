/* Table : Salary
+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| id          | int      |
| name        | varchar  |
| sex         | ENUM     |
| salary      | int      |
+-------------+----------+
id is the primary key (column with unique values) for this table.
The sex column is ENUM (category) value of type ('m', 'f').
The table contains information about an employee.

Write a solution to swap all 'f' and 'm' values (i.e., change all 'f' to 'm' and vice versa) 
with a single update statement and no intermediate temporary tables. */

UPDATE Salary
SET sex = CASE 
            WHEN sex = 'm' THEN 'f'
            WHEN sex = 'f' THEN 'm'
          END;

/* OR */

UPDATE Salary
SET sex = if(sex = 'm', 'f', 'm');
/* if(condition, value_if_true, value_if_false) */
