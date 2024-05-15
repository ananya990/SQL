/* Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns. 

Table : COUNTRY                                         Table : CITY 
+-----------------+---------------+                     +-------------+--------------+
| Field           | Type          |                     | Field       | Type         |
+-----------------+---------------+                     +-------------+--------------+
| CODE            | VARCHAR2(3)   |                     | ID          | NUMBER       |
| NAME            | VARCHAR2(44)  |                     | NAME        | VARCHAR2(20) |
| CONTINENT       | VARCHAR2(13)  |                     | COUNTRYCODE | VARCHAR2(3)  |
| REGION          | VARCHAR2(25)  |                     | DISTRICT    | VARCHAR2     |
| SURFACEAREA     | NUMBER        |                     | POPULATION  | NUMBER(20)   |
| INDEPYEAR       | VARCHAR2(5)   |                     +-------------+--------------+
| POPULATION      | NUMBER        |
| LIFEEXPECTANCY  | VARCHAR2(4)   |
| GNP             | NUMBER        |
| GNPOLD          | VARCHAR2(9)   |
| LOCALNAME       | VARCHAR2(44)  |
| GOVERNMENTFORM  | VARCHAR2(44)  |
| HEADOFSTATE     | VARCHAR2(32)  |
| CAPITAL         | VARCHAR2(4)   |
| CODE2           | VARCHAR2(2)   |
+-----------------+---------------+   
*/

SELECT SUM(CITY.Population)
FROM CITY
JOIN COUNTRY ON CITY.CountryCode = COUNTRY.Code
WHERE COUNTRY.CONTINENT = 'Asia';
