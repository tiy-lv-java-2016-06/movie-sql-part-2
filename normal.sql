-- Get the average rating for a movie
SELECT title, avg(rating)
FROM movies
  JOIN ratings on ratings.movieid = movies.movieid
GROUP BY title;

-- Get the total ratings for a movie
SELECT title, count(rating)
from movies
  join ratings on ratings.movieid = movies.movieid
GROUP BY title;

-- Get the total movies for a genres
SELECT genre.genres, count(movies.genres)
FROM genre
  join movies on movies.genres = genre.genres
GROUP BY genre.genres;

-- Get the average rating for a user
SELECT userid, avg(rating)
FROM ratings
  join movies on ratings.movieid = movies.movieid
group by userid
ORDER BY userid ASC;

-- Find the user with the most ratings
SELECT userid, count(rating)
from ratings
group by userid
ORDER BY count(rating) DESC LIMIT 1;

-- Find the user with the highest average rating
select userid, avg(rating)
from ratings
group BY userid
ORDER BY avg(rating) desc limit 1;

-- Find the user with the highest average rating with more than 50 reviews
select userid, avg(rating), count(rating)
from ratings
GROUP BY userid
    having count(ratings.rating) > 50
ORDER BY count(rating), avg(rating) desc limit 1;

-- Find the movies with an average rating over 4
select title, avg(rating)
from movies
  join ratings ON movies.movieid = ratings.movieid
GROUP BY title
  HAVING avg(rating) > 4
order BY avg(rating) desc;

-- For each genre find the total number of reviews(ratings) as well as the average review(rating) sort by highest average review(rating).
select genre.genres, count(rating), avg(rating)
from ratings
  JOIN movies on ratings.movieid = movies.movieid
  JOIN genre ON movies.genres = genre.genres
GROUP BY genre.genres
ORDER BY avg(rating) desc;



/*** Complete the following modification objectives:  ***/



-- Create a new table called actors (We are going to pretend the actor can only play in one movie) The table should
-- include name, character name, foreign key to movies and date of birth at least plus an id field.
CREATE TABLE public.actors (
  id SERIAL PRIMARY KEY NOT NULL,
  NAME CHARACTER VARYING not NULL,
  character_name character VARYING not null,
  brith_date DATE not null
);

-- Pick 3 movies and create insert statements for 10 actors each. You should use the multi value insert statements

/***  MIB  ***/
INSERT INTO actors (NAME, character_name, brith_date)
  VALUES('Will Smith', 'Agent J', '9/25/1968'),
    ('Tommy Lee Jones', 'Agent K', '9/15/1946'),
    ('Linda Fiorentino', 'Dr. Laurel Weaver', '3/9/58'),
    ('Vincent D Onofrio','Edgar', '6/30/1959'),
    ('Rip Torn', 'Agent Zed', '2/6/1931'),
    ('Tony Shalhoub', 'Jack Jeebs', '10/9/1953'),
    ('Siobhan Hogan', 'Beatrice', '5/13/1961'),
    ('David Cross', 'Newton', '4/4/1964'),
    ('Tim Blaney', 'Frank the Pug', '4/23/1959'),
    ('Brad Abrell', 'Woman Guy #1', '6/1/1965');

/*** Blade 3 ***/
INSERT INTO actors (NAME, character_name, brith_date)
  VALUES ('Ryan Reynolds', 'Hannibal King', '10/23/1976'),
    ('Wesley Snipes', 'Blade', '7/31/1962'),
    ('Jessica Beal', 'Abigail Whistler', '3/3/1982'),
    ('Vampie Dude', 'Pale Vampire', '2/5/1679'),
    ('Vampire Dudette', 'Dark Vampire', '5/2/1566'),
    ('Markus Bum', 'Homeless Man', '9/4/1986'),
    ('Denise Applebooty', 'Hoe', '8/5/1934'),
    ('Marquan Jenkins', 'Big Pimpin', '7/4/1990'),
    ('Jake Winfold', 'Ugly Guy #1', '7/3/1955'),
    ('Chris Paul', 'Basketball Kid #2', '5/6/1985');

/***  Hackers  ***/
INSERT INTO actors (NAME, character_name, brith_date)
    VALUES ('Angelina Jolie', 'Kate Libby', '6/4/1954'),
      ('Johnny Lee Miller', 'Dade Murphy', '11/15/1972'),
      ('Matthew Lillard', 'Emmanuel Goldstein', '1/24/1970'),
      ('Fisher Stevens', 'Eugene Belford', '11/27/1963'),
      ('Jesse Bradford', 'Joey Pardella', '5/28/1979'),
      ('Renoly Santiago', 'Ramon Sanchez', '3/15/1974'),
      ('Lauence Mason', 'Paul Cook', '5/5/1955'),
      ('Lorraine Bracco', 'Margo', '10/2/1954'),
      ('Marc Anothony', 'S.S. Agent Ray', '9/16/1968'),
      ('Penn Jillette', 'Hal', '3/5/1955');


-- Create a new column in the movie table to hold the MPAA rating. UPDATE 5 different movies to their correct rating

ALTER TABLE public.movies ADD MPAA_rating INTEGER NOT NULL;

--Toy Story
UPDATE movies
set mpaa_rating = 'G'
where movieid = 1;

--Jumanji
UPDATE movies
set mpaa_rating = 'PG'
where movieid = 2;

--Fun With Dick and Jane
UPDATE movies
set mpaa_rating = 'PG-13'
where movieid = 42011;

--Waiting to  Exhale
UPDATE movies
set mpaa_rating = 'R'
where movieid = 4;

--Heat
UPDATE movies
set mpaa_rating = 'R'
where movieid = 6;


