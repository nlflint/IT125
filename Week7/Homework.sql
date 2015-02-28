-- 3 queries using string functions
select concat(first_name, ' ', last_name) as critic_full_name
from critics;

select replace(title, 'Smith', 'White') as movie_with_smith_replaced
from movies;

select DATE_FORMAT(rating_date, '%Y') as year, count(*) as ratings_per_year
from ratings
group by DATE_FORMAT(rating_date, '%Y');

-- The case function: Average scores equal or greater than 5 are fresh.
select 
	concat(m.title, ' (', m.release_year, ')') as movie,
    case when avg(r.rating) >= 5 then 'Fresh!'
        else 'Rotten!'
	end as potato_rating
from ratings r 
join movies m on m.movie_id = r.movie_id
group by concat(m.title, ' (', m.release_year, ')');

-- Another flow control function. Determines if movie is scary based on if it has horror genre.
select concat(m.title, ' (', m.release_year, ')') as movie,
	if (group_concat(g.genre) like '%Horror%', 'Scary!', 'Not scary') as is_scary
from movies m
join movie_genres mg on mg.movie_id = m.movie_id
join genres g on g.genre_id = mg.genre_id
group by concat(m.title, ' (', m.release_year, ')');

