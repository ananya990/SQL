/* Query the total population of all cities in CITY where District is California.

Table: City
+--------------+--------------+
| Field        | Type         |
+--------------+--------------+
| ID           | NUMBER       |
| NAME         | VARCHAR2(17) |
| COUNTRYCODE  | VARCHAR2(3)  |
| DISTRICT     | VARCHAR2(20) |
| POPULATION   | NUMBER       |
+--------------+--------------+ */

SELECT SUM(Population) AS TotalPopulation
FROM CITY
WHERE District = 'California';
