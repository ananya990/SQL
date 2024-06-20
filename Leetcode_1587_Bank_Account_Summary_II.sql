/* Table : Users                                      Table : Transactions
+--------------+---------+                            +---------------+---------+
| Column Name  | Type    |                            | Column Name   | Type    |
+--------------+---------+                            +---------------+---------+
| account      | int     |                            | trans_id      | int     |
| name         | varchar |                            | account       | int     |
+--------------+---------+                            | amount        | int     |
account is the primary key.                           | transacted_on | date    |
Each row contains a user's                            +---------------+---------+
account number in the bank.                           trans_id is the primary key.
There will be no two users having                     Each row records changes made to all accounts.
the same name in the table.                           amount is positive for received money and 
                                                      negative for transferred money.
                                                      All accounts start with a balance of 0.

Write a solution to report the name and balance of users with a balance higher than 10000. 
The balance of an account is equal to the sum of the amounts of all transactions involving that account. */

SELECT u.name, SUM(t.amount) AS balance
FROM Users u
JOIN Transactions t ON u.account = t.account
GROUP BY u.name
HAVING SUM(t.amount) > 10000;

/* OR */

WITH CTE_table as (
SELECT account,SUM(amount) as BALANCE
FROM Transactions
GROUP BY account)

SELECT A.name , CTE_table.BALANCE
FROM Users A 
JOIN CTE_table ON A.account = CTE_table.account
WHERE CTE_table.BALANCE > 10000

/* OR */

WITH t AS (
    SELECT account, name, SUM(amount) balance
    FROM users u INNER JOIN transactions t USING(account)
    GROUP BY u.account
)
SELECT name, balance
FROM t
WHERE balance > 10000;
