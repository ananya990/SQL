/* Table : Products                                             Table : Orders
+------------------+---------+                                 +---------------+---------+
| Column Name      | Type    |                                 | Column Name   | Type    |
+------------------+---------+                                 +---------------+---------+
| product_id       | int     |                                 | product_id    | int     |
| product_name     | varchar |                                 | order_date    | date    |
| product_category | varchar |                                 | unit          | int     |
+------------------+---------+                                 +---------------+---------+
product_id is the primary key for this table.                  This table may have duplicate rows.  
This table contains data about the company's products.         product_id is a foreign key to the Products table.
                                                               unit is the number of products ordered in order_date.
 
Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount. */

SELECT 
    p.product_name, 
    SUM(o.unit) AS unit
FROM 
    Products p
JOIN 
    Orders o ON p.product_id = o.product_id
WHERE 
    o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY 
    p.product_id, p.product_name
HAVING 
    SUM(o.unit) >= 100;

/* OR */

WITH SumOrders AS (
    SELECT product_id, SUM(unit) AS unit
    FROM Orders
    WHERE MONTH(order_date) = 2 AND YEAR(order_date) = 2020
    GROUP BY product_id
)

SELECT product_name, unit
FROM Products p
JOIN SumOrders s ON p.product_id = s.product_id
WHERE s.unit >= 100;

/* OR */

SELECT 
    p.product_name, 
    t.sumin AS unit 
FROM (
    SELECT 
        product_id, 
        SUM(unit) AS sumin 
    FROM 
        Orders
    WHERE 
        MONTH(order_date) = 2
        AND YEAR(order_date) = 2020
    GROUP BY 
        product_id
    HAVING 
        sumin >= 100
) AS t
LEFT JOIN 
    Products p
ON 
    t.product_id = p.product_id;
