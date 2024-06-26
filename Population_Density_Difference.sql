/* Query the difference between the maximum and minimum populations in CITY.

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

SELECT MAX(population) - MIN(population) AS population_difference
FROM CITY;
