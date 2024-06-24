/* Table : Logins
+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| user_id        | int      |
| time_stamp     | datetime |
+----------------+----------+
(user_id, time_stamp) is the primary key for this table.
Each row contains information about the login time for the user with ID user_id.
 
Write a solution to report the latest login for all users in the year 2020. 
Do not include the users who did not login in 2020. */

SELECT user_id, MAX(time_stamp) AS last_stamp
FROM Logins
WHERE time_stamp >= '2020-01-01 00:00:00'
  AND time_stamp < '2021-01-01 00:00:00'
GROUP BY user_id;

/* OR */

SELECT 
    user_id, 
    MAX(time_stamp) AS last_stamp
FROM 
    Logins
WHERE 
    YEAR(time_stamp) = 2020
GROUP BY user_id;

/* OR */

SELECT user_id, MAX(time_stamp) AS last_stamp  
FROM Logins
WHERE time_stamp  LIKE '2020%'
GROUP BY user_id;

/* OR */

WITH cdn AS(
    SELECT user_id, MAX(time_stamp) as last_stamp FROM Logins
    WHERE YEAR(time_stamp) = 2020
    GROUP BY user_id 
)
SELECT * FROM cdn;

/* OR */

WITH cte AS (
    SELECT 
        user_id, 
        time_stamp, 
        EXTRACT(YEAR FROM time_stamp) AS year 
    FROM 
        Logins
)
SELECT 
    user_id, 
    MAX(time_stamp) AS last_stamp 
FROM 
    cte 
WHERE 
    year = 2020 
GROUP BY 
    user_id;
