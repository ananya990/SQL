/* Table:SalesPerson              Table:Company                   Table:Orders
+-----------------+-------+       +-------------+---------+       +-------------+-------+
| Column Name     | Type  |       | Column Name | Type    |       | Column Name | Type  |
+-----------------+-------+       +-------------+---------+       +-------------+-------+
| sales_id        | int   |       | com_id      | int     |       | order_id    | int   |
| name            | varchar       | name        | varchar |       | order_date  | date  |
| salary          | int   |       | city        | varchar |       | com_id      | int   |
| commission_rate | int   |       +-------------+---------+       | sales_id    | int   |
| hire_date       | date  |                                       | amount      | int   |
+-----------------+-------+                                       +-------------+-------+

Write a solution to find the names of all the salespersons who did not have 
any orders related to the company with the name "RED". */

SELECT sp.name
FROM SalesPerson sp
WHERE sp.sales_id NOT IN (
    SELECT o.sales_id
    FROM Orders o
    JOIN Company c ON o.com_id = c.com_id
    WHERE c.name = 'RED' );
