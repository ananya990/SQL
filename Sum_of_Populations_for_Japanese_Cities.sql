/* Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.

+--------------+--------------+
| Field        | Type         |
+--------------+--------------+
| ID           | NUMBER       |
| NAME         | VARCHAR2(17) |
| COUNTRYCODE  | VARCHAR2(3)  |
| DISTRICT     | VARCHAR2(20) |
| POPULATION   | NUMBER       |
+--------------+--------------+ */

SELECT SUM(POPULATION) AS Total_Population
FROM CITY
WHERE COUNTRYCODE = 'JPN';
