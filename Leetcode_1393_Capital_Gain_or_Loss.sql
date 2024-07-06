/* Table : Stocks
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| stock_name    | varchar |
| operation     | enum    |
| operation_day | int     |
| price         | int     |
+---------------+---------+
(stock_name, operation_day) is the primary key for this table.
The operation column is an ENUM (category) of type ('Sell', 'Buy')
Each row of this table indicates that the stock which has stock_name had an operation on the day operation_day with the price.
It is guaranteed that each 'Sell' operation for a stock has a corresponding 'Buy' operation in a previous day. 
It is also guaranteed that each 'Buy' operation for a stock has a corresponding 'Sell' operation in an upcoming day.
 
Write a solution to report the Capital gain/loss for each stock.
The Capital gain/loss of a stock is the total gain or loss after buying and selling the stock one or many times. */

SELECT 
    stock_name,
    SUM(
        CASE
            WHEN operation = 'Sell' THEN price
            WHEN operation = 'Buy' THEN -price
        END
    ) AS capital_gain_loss
FROM 
    Stocks
GROUP BY 
    stock_name;

/* OR */

SELECT Buys.stock_name, Sells.total - Buys.total AS capital_gain_loss  
FROM (
    SELECT stock_name, operation, SUM(price) AS total 
    FROM Stocks 
    WHERE operation = 'Buy'
    GROUP BY stock_name, operation

) Buys 
INNER JOIN (
    SELECT stock_name, operation, SUM(price) AS total 
    FROM Stocks 
    WHERE operation = 'Sell'
    GROUP BY stock_name, operation
) Sells ON Buys.stock_name = Sells.stock_name;

/* OR */

WITH operation AS(
    SELECT *, 
    LAG(price, 1, 0) OVER (PARTITION BY stock_name order by operation_day) AS last_operation_price
    FROM Stocks
)

SELECT stock_name, SUM(price - last_operation_price) AS capital_gain_loss
FROM operation
WHERE operation = 'sell'
GROUP BY stock_name;

/* OR */

WITH cte AS (
    SELECT 
        stock_name, 
        SUM(IF(operation = 'BUY', price, 0)) AS basis, 
        SUM(IF(operation = 'Sell', price, 0)) AS proceeds
    FROM 
        Stocks
    GROUP BY 
        stock_name
)
SELECT
    stock_name, 
    (proceeds - basis) AS capital_gain_loss
FROM 
    cte; 
