USE rotten_potatoes;

-- #1 All ratings for Alien
SELECT CONCAT(c.first_name, ' ', c.last_name) AS critic, r.rating
FROM movies m
	JOIN ratings r
		ON r.movie_id = m.movie_id
	JOIN critics c
		ON c.critic_id = r.critic_id
WHERE m.title = 'Alien';

-- #2 All of Adam Adonis's movie ratings with a rating greater than or equal to 6
SELECT m.title, m.release_year, r.rating
FROM critics c
	JOIN ratings r
		USING (critic_id)
	JOIN movies m
		USING (movie_id)
WHERE c.first_name = 'Adam'
	AND c.last_name = 'Adonis'
	AND r.rating >= 6;

-- #3 All Movies and their genres
SELECT CONCAT(m.title, ' (', m.release_year, ')') AS movie, g.genre
FROM movies m
	JOIN movie_genres mg
		USING (movie_id)
	JOIN genres g 
		USING (genre_id);

-- #4 first 5 ratings made by critics in 2012
SELECT CONCAT(m.title, ' (', m.release_year, ')') AS movie, r.rating, CONCAT(c.first_name, ' ', c.last_name) AS critic
FROM ratings r
	JOIN movies m
		USING (movie_id)
	JOIN critics c
		USING (critic_id)
WHERE YEAR(r.rating_date) = 2012
ORDER BY r.rating_date
LIMIT 5;