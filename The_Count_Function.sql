/* Query a count of the number of cities in CITY having a Population larger than 100000.

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

SELECT COUNT(*)
FROM CITY
WHERE Population >100000;
