/* Table : Movies                                      Table : Users                                         Table : MovieRating
+---------------+---------+                            +---------------+---------+                           +---------------+---------+
| Column Name   | Type    |                            | Column Name   | Type    |                           | Column Name   | Type    |
+---------------+---------+                            +---------------+---------+                           +---------------+---------+
| movie_id      | int     |                            | user_id       | int     |                           | movie_id      | int     |
| title         | varchar |                            | name          | varchar |                           | user_id       | int     |
+---------------+---------+                            +---------------+---------+                           | rating        | int     |
movie_id is the primary key for this table.            user_id is the primary key for this table.            | created_at    | date    |
title is the name of the movie.                                                                              +---------------+---------+
                                                                                                             (movie_id, user_id) is the primary key for this table.
                                                                                                             This table contains the rating of a movie by a user in their review.
                                                                                                             created_at is the user's review date. 

Write a solution to:
       - Find the name of the user who has rated the greatest number of movies. 
         In case of a tie, return the lexicographically smaller user name.
        
       - Find the movie name with the highest average rating in February 2020. 
         In case of a tie, return the lexicographically smaller movie name. */

WITH UserRatingCounts AS (
    SELECT 
        u.user_id,
        u.name,
        COUNT(mr.movie_id) AS rating_count
    FROM 
        Users u
    JOIN 
        MovieRating mr ON u.user_id = mr.user_id
    GROUP BY 
        u.user_id, u.name
),
MaxRatingCount AS (
    SELECT 
        MAX(rating_count) AS max_count
    FROM 
        UserRatingCounts
),
GreatestRater AS (
    SELECT 
        urc.name AS results
    FROM 
        UserRatingCounts urc
    JOIN 
        MaxRatingCount mrc ON urc.rating_count = mrc.max_count
    ORDER BY 
        urc.name
    LIMIT 1
),
Feb2020Ratings AS (
    SELECT 
        mr.movie_id,
        m.title,
        AVG(mr.rating) AS avg_rating
    FROM 
        MovieRating mr
    JOIN 
        Movies m ON mr.movie_id = m.movie_id
    WHERE 
        mr.created_at >= '2020-02-01' AND mr.created_at <= '2020-02-29'
    GROUP BY 
        mr.movie_id, m.title
),
MaxAverageRating AS (
    SELECT 
        MAX(avg_rating) AS max_avg_rating
    FROM 
        Feb2020Ratings
),
HighestRatedMovie AS (
    SELECT 
        f2r.title AS results
    FROM 
        Feb2020Ratings f2r
    JOIN 
        MaxAverageRating mar ON f2r.avg_rating = mar.max_avg_rating
    ORDER BY 
        f2r.title
    LIMIT 1
)
SELECT * FROM GreatestRater
UNION ALL
SELECT * FROM HighestRatedMovie;

/* OR */

(SELECT name AS results
FROM MovieRating JOIN Users USING(user_id)
GROUP BY name
ORDER BY COUNT(*) DESC, name
LIMIT 1)

UNION ALL

(SELECT title AS results
FROM MovieRating JOIN Movies USING(movie_id)
WHERE EXTRACT(YEAR_MONTH FROM created_at) = 202002
GROUP BY title
ORDER BY AVG(rating) DESC, title
LIMIT 1);

/* OR */

SELECT *
FROM (
    SELECT u.name AS results
    FROM Users u
    JOIN (
        SELECT user_id, COUNT(*) AS num
        FROM MovieRating
        GROUP BY user_id
    ) AS uc
    USING (user_id)
    ORDER BY uc.num DESC, u.name ASC
    LIMIT 1
) AS user_query
UNION ALL
SELECT *
FROM (
    SELECT m.title AS results
    FROM Movies m
    JOIN (
        SELECT movie_id, AVG(rating) AS avg_rating
        FROM MovieRating
        WHERE YEAR(created_at) = 2020 AND MONTH(created_at) = 2
        GROUP BY movie_id
    ) AS mr
    USING (movie_id)
    ORDER BY mr.avg_rating DESC, m.title ASC
    LIMIT 1
) AS movie_query;
