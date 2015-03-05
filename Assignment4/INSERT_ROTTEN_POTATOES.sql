USE rotten_potatoes;

INSERT INTO movies VALUES
(1,'Captain America: The Winter Soldier',2014),
(2,'Forbidden Planet',1956),
(3,'Mr. & Mrs. Smith',2005),
(4,'Mr. & Mrs. Smith',1941),
(5,'Alien',1979);

INSERT INTO genres VALUES
(1,'Action'),
(2,'Adventure'),
(3,'Comedy'),
(4,'Romance'),
(5,'Horror'),
(6,'Sci-Fi'),
(7,'Family'),
(8,'Crime');

INSERT INTO movie_genres (movie_id, genre_id) VALUES 
(1,1),
(1,2),
(1,6),
(2,1),
(2,2),
(2,6),
(2,7),
(3,1),
(3,3),
(3,4),
(3,8),
(4,3),
(4,4),
(5,5),
(5,6);

INSERT INTO critics VALUES
(1,'aadonis@blah.com','Adam','Adonis'),
(2,'aadonis@blah.com','Bethany','Baker'),
(3,'ccarter@blah.com','Chris','Carter'),
(4,'ddoomore@blah.com','Diana','Doomore'),
(5,'ewine@blah.com','Egon','Earlywine');

INSERT INTO ratings (critic_id,movie_id,rating,rating_date) VALUES 
(1,1,10,'2014-03-17 12:50:11.000'),
(1,2,2,'2011-10-02 10:51:54.000'),
(1,3,8,'2012-05-04 08:19:01.000'),
(1,4,3,'2011-08-14 11:09:33.000'),
(1,5,4,'2012-07-16 05:03:58.000'),
(2,1,8,'2014-08-23 21:47:42.000'),
(2,2,9,'2011-10-12 12:54:03.000'),
(2,3,5,'2014-03-19 18:15:43.000'),
(2,4,3,'2013-01-03 04:25:55.000'),
(2,5,4,'2011-06-14 21:36:09.000'),
(3,1,6,'2014-03-07 20:34:09.000'),
(3,2,3,'2012-08-22 18:05:13.000'),
(3,3,8,'2012-12-17 11:07:02.000'),
(3,4,10,'2010-11-17 22:22:49.000'),
(3,5,10,'2013-12-09 08:32:48.000'),
(4,1,6,'2014-03-06 13:50:19.000'),
(4,2,1,'2012-11-26 13:03:46.000'),
(4,3,2,'2011-01-27 13:29:55.000'),
(4,4,1,'2011-05-20 22:28:44.000'),
(4,5,4,'2014-09-04 09:12:47.000'),
(5,1,6,'2014-08-23 08:52:40.000'),
(5,2,8,'2012-09-17 14:14:13.000'),
(5,3,4,'2012-08-17 10:55:51.000'),
(5,4,1,'2013-06-08 22:50:57.000'),
(5,5,7,'2012-12-12 05:25:33.000');




