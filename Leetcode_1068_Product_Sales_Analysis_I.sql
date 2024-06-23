/* Table : Sales                                         Table : Product
+-------------+-------+                                  +--------------+---------+
| Column Name | Type  |                                  | Column Name  | Type    |
+-------------+-------+                                  +--------------+---------+
| sale_id     | int   |                                  | product_id   | int     |
| product_id  | int   |                                  | product_name | varchar |
| year        | int   |                                  +--------------+---------+
| quantity    | int   |                                  product_id is the primary key.
| price       | int   |                                  Each row of this table indicates the 
+-------------+-------+                                  product name of each product.
(sale_id, year) is the primary key.
product_id is a foreign key to Product table.
Each row of this table shows a sale on the
product product_id in a certain year.
Note that the price is per unit.
 
Write a solution to report the product_name, year, and price for each sale_id in the Sales table. */

SELECT p.product_name, s.year, s.price
FROM Sales s 
JOIN Product p ON s.product_id = p.product_id;

/* OR */

SELECT p.product_name, s.year, s.price
FROM Sales s, Product p 
WHERE s.product_id = p.product_id;

/* OR */

SELECT product_name, year, price
FROM Sales s
LEFT JOIN Product p USING(product_id)
