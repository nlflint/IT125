-- Nathan Flint
-- Assignment 4


/* -------------------------------
-- Four queries from the book   --
----------------------------------*/
USE ap;

-- #6 from Chapter 3 exercises
SELECT vendor_name, vendor_contact_last_name, vendor_contact_first_name
FROM vendors
ORDER BY vendor_contact_last_name, vendor_contact_first_name;

-- #7 from Chapter 3 exercises
SELECT CONCAT(vendor_contact_last_name, ', ', vendor_contact_first_name) AS full_name
FROM vendors
WHERE LEFT(vendor_contact_last_name, 1) in ('A','B','C','E')
ORDER BY vendor_contact_last_name, vendor_contact_first_name;

-- #8 from Chapter 3 exercises
SELECT invoice_due_date, invoice_total, invoice_total * 0.1, invoice_total * 1.1
FROM invoices
WHERE invoice_total BETWEEN 500 AND 1000
ORDER BY invoice_date desc;

-- #9 from Chapter 3 exercises
SELECT
	invoice_number,
    invoice_total,
    payment_total + credit_total AS payment_credit_total,
    invoice_total - payment_total - credit_total AS balance_due
FROM invoices
HAVING balance_due > 50
ORDER BY balance_due DESC
LIMIT 5;


/* -------------------------------
-- Four queries for my database --
----------------------------------*/
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
