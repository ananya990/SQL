/* Table : Activities
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| sell_date   | date    |
| product     | varchar |
+-------------+---------+
There is no primary key for this table. It may contain duplicates.
Each row of this table contains the product name and the date it was sold in a market.
 
Write a solution to find for each date the number of different products sold and their names.
The sold products names for each date should be sorted lexicographically.
Return the result table ordered by sell_date. */

SELECT 
    sell_date, 
    COUNT(DISTINCT product) AS num_sold, 
    GROUP_CONCAT(DISTINCT product ORDER BY product ASC) AS products
FROM 
    Activities
GROUP BY 
    sell_date;

/* OR */

WITH RankedActivities AS (
    SELECT 
        distinct sell_date, 
        product
    FROM Activities
),
AggregatedActivities AS (
    SELECT 
        sell_date, 
        COUNT( distinct product) AS num_sold,
        GROUP_CONCAT(product ORDER BY product SEPARATOR ',') AS concatenated_products
    FROM RankedActivities
    GROUP BY sell_date
)
SELECT 
    sell_date, 
    num_sold,
    TRIM(BOTH ',' FROM concatenated_products) AS products
FROM AggregatedActivities;
