USE rotten_potatoes;


-- List all the movies with release year
SELECT CONCAT(m.title, ' (', m.release_year, ')') AS name
FROM movies m;

-- All of Adam Adonis's ratings greater than or equal to 6
SELECT m.title, m.release_year, r.rating
FROM critics c
JOIN ratings r ON r.critic_id = c.critic_id
JOIN movies m ON m.movie_id = r.movie_id
WHERE c.first_name = 'Adam'
AND c.last_name = 'Adonis'
AND r.rating >= 6;

-- Movies and their genres
SELECT CONCAT(m.title, ' (', m.release_year, ')') AS movie, g.genre
FROM movies m
JOIN movie_genres mg ON m.movie_id = mg.movie_id
JOIN genres g ON g.genre_id = mg.genre_id;

-- first 5 ratings made in 2012
SELECT CONCAT(m.title, ' (', m.release_year, ')') AS movie, r.rating, CONCAT(c.first_name, ' ', c.last_name) AS critic
FROM ratings r
JOIN movies m ON m.movie_id = r.movie_id
JOIN critics c ON c.critic_id = r.critic_id
WHERE r.rating_date BETWEEN '2012-01-01' AND '2013-01-01'
ORDER BY r.rating_date
LIMIT 5;