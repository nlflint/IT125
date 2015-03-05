-- Nathan Flint
-- Assignment 6

/*-----------------------------------------
-- Chapter 9 Exercises (pages 272 & 273) --
-------------------------------------------*/

-- Problem #1
use ap;
select
	invoice_total,
	round(invoice_total,1) as invoice_total,
	round(invoice_total,0) as invoice_total
from invoices;

-- Problem #2
use ex;
select
	start_date,
    DATE_FORMAT(start_date, '%b/%d/%y') as start_date1,
    DATE_FORMAT(start_date, '%c/%e/%y') as start_date2,
    DATE_FORMAT(start_date, '%l:%i %p') as start_date3,
    DATE_FORMAT(start_date, '%c/%d/%y %l:%i %p') as start_date4
from date_sample;

-- Problem #3
use ap;
select
	vendor_name,
    UPPER(vendor_name) as vendor_name_upper,
    vendor_phone,
    SUBSTRING_INDEX(vendor_phone, '-', -1),
    CONCAT(
		SUBSTRING(vendor_phone FROM 2 FOR 3),
        '.',
        SUBSTRING(vendor_phone FROM 7 FOR 3),
        '.',
        SUBSTRING(vendor_phone FROM -4 FOR 4)
	) as phone_with_dots,
    CASE WHEN 0 < LOCATE(' ', vendor_name, LOCATE(' ', vendor_name) + 1)
		THEN SUBSTRING(
			vendor_name,
			LOCATE(' ', vendor_name),
			LOCATE(' ', vendor_name, LOCATE(' ', vendor_name) + 1) - LOCATE(' ', vendor_name))
		ELSE SUBSTRING(
			vendor_name,
			LOCATE(' ', vendor_name),
			LENGTH(vendor_name) - LOCATE(' ', vendor_name) + 1) 
	END as blah
from vendors;

-- Problem #4
select
	invoice_number,
    invoice_date,
    adddate(invoice_date, INTERVAL 30 DAY) as invoice_plus_30_days,
    payment_date,
    datediff(payment_date, invoice_date) as days_to_pay,
    DATE_FORMAT(invoice_date, '%c') as month_number,
    DATE_FORMAT(invoice_date, '%Y') as 4_digit_year
from invoices
where DATE_FORMAT(invoice_date, '%c') = 5;




/*-----------------------------------------
-- Three string queries for my database  --
-------------------------------------------*/

select concat(first_name, ' ', last_name) as critic_full_name
from critics;

select replace(title, 'Smith', 'White') as movie_with_smith_replaced
from movies;

select DATE_FORMAT(rating_date, '%Y') as year, count(*) as ratings_per_year
from ratings
group by DATE_FORMAT(rating_date, '%Y');



/*---------------------------------
-- Case function for my database --
-----------------------------------*/
-- The case function: Average scores equal or greater than 5 are fresh.
select 
	concat(m.title, ' (', m.release_year, ')') as movie,
    case when avg(r.rating) >= 5 then 'Fresh!'
        else 'Rotten!'
	end as potato_rating
from ratings r 
join movies m on m.movie_id = r.movie_id
group by concat(m.title, ' (', m.release_year, ')');



/*----------------------------
-- Query using IF statement --
------------------------------*/
-- Another flow control function. Determines if movie is scary based on if it has horror genre.
select concat(m.title, ' (', m.release_year, ')') as movie,
	if (group_concat(g.genre) like '%Horror%', 'Scary!', 'Not scary') as is_scary
from movies m
join movie_genres mg on mg.movie_id = m.movie_id
join genres g on g.genre_id = mg.genre_id
group by concat(m.title, ' (', m.release_year, ')');