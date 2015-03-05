DROP DATABASE IF EXISTS rotten_potatoes;
CREATE DATABASE rotten_potatoes;

USE rotten_potatoes;

CREATE TABLE movies (
  movie_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(100),
  release_year INT
  );

CREATE TABLE genres (
  genre_id INT PRIMARY KEY AUTO_INCREMENT,
  genre VARCHAR(45)
  );
  
CREATE TABLE movie_genres (
  movie_genre_id INT PRIMARY KEY AUTO_INCREMENT,
  movie_id INT,
  genre_id INT,
  CONSTRAINT movies_genres_fk_movies
	FOREIGN KEY (movie_id)
    REFERENCES movies (movie_id),
  CONSTRAINT gmovies_genres_fk_genres
	FOREIGN KEY (genre_id)
    REFERENCES genres (genre_id)
  );

CREATE TABLE critics (
  critic_id INT PRIMARY KEY AUTO_INCREMENT,
  email_address VARCHAR(100) NOT NULL,
  first_name VARCHAR(45) NULL,
  last_name VARCHAR(45) NULL
  );

CREATE TABLE ratings (
  rating_id INT PRIMARY KEY AUTO_INCREMENT,
  critic_id INT,
  movie_id INT,
  rating INT(10) NOT NULL,
  rating_date DATETIME NULL,
  CONSTRAINT ratings_fk_critics
	FOREIGN KEY (critic_id)
    REFERENCES critics (critic_id),
  CONSTRAINT ratings_fk_movies
	FOREIGN KEY (movie_id)
    REFERENCES movies (movie_id)
  );

