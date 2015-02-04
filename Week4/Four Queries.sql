USE rotten_potatoes;

-- All of Adam Adonis's ratings
SELECT m.title, m.release_year, r.rating
FROM critics c
JOIN ratings r ON r.critic_id = c.critic_id
JOIN movies m ON m.movie_id = r.movie_id
WHERE c.first_name = 'Adam'
AND c.last_name = 'Adonis';

-- All ratings for Alien
SELECT c.first_name, c.last_name, r.rating
FROM movies m
JOIN ratings r ON r.movie_id = m.movie_id
JOIN critics c ON c.critic_id = r.critic_id
WHERE m.title = 'Alien';

-- The genres of all movies
SELECT m.title, m.release_year, g.genre
FROM movies m
JOIN movie_genres mg ON m.movie_id = mg.movie_id
JOIN genres g ON g.genre_id = mg.genre_id;

-- Ratings for movies with SciFi genre
SELECT c.first_name, c.last_name, m.title, m.release_year, g.genre, r.rating
FROM critics c
JOIN ratings r ON r.critic_id = c.critic_id
JOIN movies m ON m.movie_id = r.movie_id
JOIN movie_genres mg ON mg.movie_id = m.movie_id
JOIN genres g ON g.genre_id = mg.genre_id
WHERE g.genre = 'Sci-Fi';
