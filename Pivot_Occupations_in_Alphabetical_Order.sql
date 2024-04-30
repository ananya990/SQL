/* Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed 
underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation. 

Table: OCCUPATIONS
+--------------+--------------+
|    Column    |     Type     |
+--------------+--------------+
|     NAME     |    STRING    |
|  OCCUPATION  |    STRING    |
+--------------+--------------+ */

SELECT 
    MAX(CASE WHEN occupation = 'Doctor' THEN name END) AS Doctor,
    MAX(CASE WHEN occupation = 'Professor' THEN name END) AS Professor,
    MAX(CASE WHEN occupation = 'Singer' THEN name END) AS Singer,
    MAX(CASE WHEN occupation = 'Actor' THEN name END) AS Actor
FROM (
    SELECT 
        name,
        occupation,
        ROW_NUMBER() OVER(PARTITION BY occupation ORDER BY name) AS row_num
    FROM 
        Occupations
) AS T
GROUP BY 
    row_num
ORDER BY 
    row_num;

/* 
Sample Input :
+----------+------------+
|   Name   | Occupation |
+----------+------------+
| Samantha |   Doctor   |
|   Julia  |   Actor    |
|  Maria   |   Actor    |
|  Meera   |   Singer   |
|  Ashely  | Professor  |
|   Ketty  | Professor  |
| Christeen| Professor  |
|   Jane   |   Actor    |
|  Jenny   |   Doctor   |
|  Priya   |   Singer   |
+----------+------------+

Sample Output :
Jenny    Ashley     Meera  Jane
Samantha Christeen  Priya  Julia
NULL     Ketty      NULL   Maria

Explanation :
The first column is an alphabetically ordered list of Doctor names.
The second column is an alphabetically ordered list of Professor names.
The third column is an alphabetically ordered list of Singer names.
The fourth column is an alphabetically ordered list of Actor names.
The empty cell data for columns with less than the maximum number of names per occupation 
(in this case, the Professor and Actor columns) are filled with NULL values.*/
