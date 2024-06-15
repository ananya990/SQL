/* Table : Teacher
+-------------+------+
| Column Name | Type |
+-------------+------+
| teacher_id  | int  |
| subject_id  | int  |
| dept_id     | int  |
+-------------+------+
(subject_id, dept_id) is the primary key  of this table.
Each row in this table indicates that the teacher with teacher_id 
teaches the subject subject_id in the department dept_id.
 
Write a solution to calculate the number of unique subjects each teacher teaches in the university. */

SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;

/* OR */

WITH CTE AS(
    SELECT TEACHER_ID, SUBJECT_ID, COUNT(TEACHER_ID) AS CNT
    FROM TEACHER
    GROUP BY TEACHER_ID, SUBJECT_ID
)

SELECT teacher_id, COUNT(TEACHER_ID) AS cnt
FROM CTE
GROUP BY TEACHER_ID;
