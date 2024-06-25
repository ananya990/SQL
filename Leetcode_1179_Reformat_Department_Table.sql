/* Table: Department
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| revenue     | int     |
| month       | varchar |
+-------------+---------+
In SQL,(id, month) is the primary key of this table.
The table has information about the revenue of each department per month.
The month has values in ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"].

Reformat the table such that there is a department id column and a revenue column for each month.

Example -
Input: Department table:
+------+---------+-------+
| id   | revenue | month |
+------+---------+-------+
| 1    | 8000    | Jan   |
| 2    | 9000    | Jan   |
| 3    | 10000   | Feb   |
| 1    | 7000    | Feb   |
| 1    | 6000    | Mar   |
+------+---------+-------+

Output: 
+------+-------------+-------------+-------------+-----+-------------+
| id   | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... | Dec_Revenue |
+------+-------------+-------------+-------------+-----+-------------+
| 1    | 8000        | 7000        | 6000        | ... | null        |
| 2    | 9000        | null        | null        | ... | null        |
| 3    | null        | 10000       | null        | ... | null        |
+------+-------------+-------------+-------------+-----+-------------+ */

WITH cte AS (
    SELECT id, month, SUM(revenue) AS revenue
    FROM Department
    GROUP BY id, month
)
SELECT DISTINCT d.id,
    (SELECT cte.revenue FROM cte WHERE d.id = cte.id AND cte.month = 'Jan') AS Jan_Revenue,
    (SELECT cte.revenue FROM cte WHERE d.id = cte.id AND cte.month = 'Feb') AS Feb_Revenue,
    (SELECT cte.revenue FROM cte WHERE d.id = cte.id AND cte.month = 'Mar') AS Mar_Revenue,
    (SELECT cte.revenue FROM cte WHERE d.id = cte.id AND cte.month = 'Apr') AS Apr_Revenue,
    (SELECT cte.revenue FROM cte WHERE d.id = cte.id AND cte.month = 'May') AS May_Revenue,
    (SELECT cte.revenue FROM cte WHERE d.id = cte.id AND cte.month = 'Jun') AS Jun_Revenue,
    (SELECT cte.revenue FROM cte WHERE d.id = cte.id AND cte.month = 'Jul') AS Jul_Revenue,
    (SELECT cte.revenue FROM cte WHERE d.id = cte.id AND cte.month = 'Aug') AS Aug_Revenue,
    (SELECT cte.revenue FROM cte WHERE d.id = cte.id AND cte.month = 'Sep') AS Sep_Revenue,
    (SELECT cte.revenue FROM cte WHERE d.id = cte.id AND cte.month = 'Oct') AS Oct_Revenue,
    (SELECT cte.revenue FROM cte WHERE d.id = cte.id AND cte.month = 'Nov') AS Nov_Revenue,
    (SELECT cte.revenue FROM cte WHERE d.id = cte.id AND cte.month = 'Dec') AS Dec_Revenue
FROM Department d;

/* OR */

SELECT 
    id,
    MAX(CASE WHEN month = 'Jan' THEN revenue ELSE null END) AS Jan_Revenue,
    MAX(CASE WHEN month = 'Feb' THEN revenue ELSE null END) AS Feb_Revenue,
    MAX(CASE WHEN month = 'Mar' THEN revenue ELSE null END) AS Mar_Revenue,
    MAX(CASE WHEN month = 'Apr' THEN revenue ELSE null END) AS Apr_Revenue,
    MAX(CASE WHEN month = 'May' THEN revenue ELSE null END) AS May_Revenue,
    MAX(CASE WHEN month = 'Jun' THEN revenue ELSE null END) AS Jun_Revenue,
    MAX(CASE WHEN month = 'Jul' THEN revenue ELSE null END) AS Jul_Revenue,
    MAX(CASE WHEN month = 'Aug' THEN revenue ELSE null END) AS Aug_Revenue,
    MAX(CASE WHEN month = 'Sep' THEN revenue ELSE null END) AS Sep_Revenue,
    MAX(CASE WHEN month = 'Oct' THEN revenue ELSE null END) AS Oct_Revenue,
    MAX(CASE WHEN month = 'Nov' THEN revenue ELSE null END) AS Nov_Revenue,
    MAX(CASE WHEN month = 'Dec' THEN revenue ELSE null END) AS Dec_Revenue
FROM 
    Department
GROUP BY 
    id;

/* OR */

SELECT id,
  MAX(IF(month='Jan',revenue,NULL)) AS Jan_Revenue,
  MAX(IF(month='Feb',revenue,NULL)) AS Feb_Revenue,
  MAX(IF(month='Mar',revenue,NULL)) AS Mar_Revenue,
  MAX(IF(month='Apr',revenue,NULL)) AS Apr_Revenue,
  MAX(IF(month='May',revenue,NULL)) AS May_Revenue,
  MAX(IF(month='Jun',revenue,NULL)) AS Jun_Revenue,
  MAX(IF(month='Jul',revenue,NULL)) AS Jul_Revenue,
  MAX(IF(month='Aug',revenue,NULL)) AS Aug_Revenue,
  MAX(IF(month='Sep',revenue,NULL)) AS Sep_Revenue,
  MAX(IF(month='Oct',revenue,NULL)) AS Oct_Revenue,
  MAX(IF(month='Nov',revenue,NULL)) AS Nov_Revenue,
  MAX(IF(month='Dec',revenue,NULL)) AS Dec_Revenue
FROM Department
GROUP BY id;

/* OR */

SELECT id,
       SUM(if(month = 'Jan', revenue, null)) AS Jan_Revenue,
       SUM(if(month = 'Feb', revenue, null)) AS Feb_Revenue,
       SUM(if(month = 'Mar', revenue, null)) AS Mar_Revenue,
       SUM(if(month = 'Apr', revenue, null)) AS Apr_Revenue,
       SUM(if(month = 'May', revenue, null)) AS May_Revenue,
       SUM(if(month = 'Jun', revenue, null)) AS Jun_Revenue,
       SUM(if(month = 'Jul', revenue, null)) AS Jul_Revenue,
       SUM(if(month = 'Aug', revenue, null)) AS Aug_Revenue,
       SUM(if(month = 'Sep', revenue, null)) AS Sep_Revenue,
       SUM(if(month = 'Oct', revenue, null)) AS Oct_Revenue,
       SUM(if(month = 'Nov', revenue, null)) AS Nov_Revenue,
       SUM(if(month = 'Dec', revenue, null)) AS Dec_Revenue
FROM Department
GROUP BY id;
