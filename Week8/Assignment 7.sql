-- Show all ratings by critics that have given a 10 rating
select concat(c.first_name, " ", c.last_name) as critic, concat(m.title, " (", m.release_year, ")") as movie
from critics c
join ratings r using(critic_id)
join movies m using(movie_id)
where c.critic_id in (
	select r.critic_id
    from ratings r
    where r.rating = 10)
order by critic, movie;

-- show all genres for action movies 
select concat(m.title, " (", m.release_year, ")") as movie, g.genre
from movies m
join movie_genres mg using(movie_id)
join genres g using (genre_id)
where m.movie_id in (
	select mg.movie_id
	from movie_genres mg
	join genres g using (genre_id)
    where g.genre = 'Action');
    
-- show the highest ratings
select concat(c.first_name, " ", c.last_name) as critic_name, concat(m.title, " (", m.release_year, ")") as movie, r.rating
from critics c
join ratings r using(critic_id)
join movies m using(movie_id)
where r.rating in (
	select max(r.rating)
    from ratings r);
    
    
    
    
    