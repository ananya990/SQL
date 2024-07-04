/* Table : ActorDirector
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| actor_id    | int     |
| director_id | int     |
| timestamp   | int     |
+-------------+---------+
timestamp is the primary key for this table.

Write a solution to find all the pairs (actor_id, director_id) 
where the actor has cooperated with the director at least three times. */

SELECT actor_id, director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(*) >= 3;

/* OR */

SELECT actor_id, director_id
FROM (SELECT actor_id, director_id, count(director_id) AS director_count 
    FROM ActorDirector
    GROUP BY actor_id, director_id
)c
WHERE director_count >= 3
