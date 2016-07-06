--Get the average rating for a movie

SELECT movies.title, avg(ratings.rating)
FROM movies
  JOIN ratings ON movies.movieid = ratings.movieid
GROUP BY movies.title;

--Get the total ratings for a movie

SELECT movies.title, count(ratings.rating)
FROM movies
  JOIN ratings ON movies.movieid = ratings.movieid
GROUP BY movies.title;

--Get the total movies for a genre

SELECT genre.genres, count(movies.title)
FROM genre
  JOIN movie_genre ON genre.id = movie_genre.genre_id
  JOIN movies ON movie_genre.movieid = movies.movieid
GROUP BY genre.genres;

--Get the average rating for a user

SELECT ratings.userid, avg(ratings.rating)
FROM ratings
GROUP BY ratings.userid;

--Find the user with the most ratings

SELECT ratings.userid, count(ratings.rating)
FROM ratings
GROUP BY ratings.userid
ORDER BY count(ratings.rating) DESC;

--Find the user with the highest average rating

SELECT ratings.userid, avg(ratings.rating)
FROM ratings
GROUP BY ratings.userid
ORDER BY avg(ratings.rating) DESC;

--Find the user with the highest average rating with more than 50 reviews

SELECT ratings.userid, avg(ratings.rating)
FROM ratings
GROUP BY ratings.userid
  HAVING count(ratings.rating) > 50
ORDER BY avg(ratings.rating) DESC;

--Find the movies with an average rating over 4

SELECT movies.title, avg(ratings.rating)
FROM movies
JOIN ratings ON movies.movieid = ratings.movieid
GROUP BY movies.title
HAVING avg(ratings.rating) > 4
ORDER BY movies.title;

--For each genre find the total number of reviews as well as the average review sort by highest average review.

SELECT genre.genres, count(ratings.rating), avg(ratings.rating)
FROM genre
  JOIN movie_genre ON genre.id = movie_genre.genre_id
  JOIN movies ON movie_genre.movieid = movies.movieid
  JOIN ratings ON movies.movieid = ratings.movieid
GROUP BY genre.genres
ORDER BY avg(ratings.rating) DESC;

--Complete the following modification objectives:

--Create a new table called actors (We are going to pretend the actor can only play in one movie) The table should include name, character name, foreign key to movies and date of birth at least plus an id field.

CREATE TABLE public.actors (
  id INTEGER PRIMARY KEY NOT NULL DEFAULT nextval('actors_id_seq'::regclass),
  name CHARACTER VARYING,
  character_name CHARACTER VARYING,
  date_of_birth CHARACTER VARYING,
  movieid INTEGER,
  FOREIGN KEY (movieid) REFERENCES public.movies (movieid)
  MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);

--Pick 3 movies and create insert statements for 10 actors each. You should use the multi value insert statements
INSERT INTO actors (name, character_name, date_of_birth, movieid) VALUES ('Tom Hanks', 'Woody', '07/09/1956', 1),
  ('Tim Allen', 'Buzz Lightyear', '06/13/1953', 1), ('Don Rickles', 'Mr. Potato Head', '05/08/1926', 1),
  ('Jim Varney', 'Slinky Dog', '06/15/1949', 1), ('Wallace Shawn', 'Rex', '11/12/1943', 1),
  ('John Ratzenberger', 'Hamm', '04/06/1947', 1), ('Annie Potts', 'Bo Peep', '10/28/1952', 1),
  ('John Morris', 'Andy', '10/02/1984', 1), ('Jack Angel', 'Shark', '10/24/1930', 1),
  ('Eric von Detten', 'Sid', '10/03/1982', 1);

/* Check to see if insert happened.

SELECT name, character_name, date_of_birth
FROM actors
JOIN movies ON actors.movieid = movies.movieid
WHERE movies.movieid = 1;
 */

INSERT INTO actors (name, character_name, date_of_birth, movieid) VALUES ('Robin Williams', 'Allan Parrish', '07/21/1951', 2),
  ('Jonathan Hyde', 'Van Pelt/Sam Parrish', '05/21/1948', 2), ('Kristen Dunst', 'Judy Shepherd', '04/30/1982', 2),
  ('Bradley Pierce', 'Peter Shepherd', '10/23/1982', 2), ('Bonnie Hunt', 'Sarah Whittle', '09/22/1961', 2),
  ('Bebe Neuwirth', 'Nora Shepherd', '12/31/1958', 2), ('David Alan Grier', 'Carl Bentley', '06/30/1955', 2),
  ('Patricia Clarkson', 'Carol Parrish', '12/29/1959', 2), ('Adam Hann-Byrd', 'Young Alan', '02/23/1982', 2),
  ('Laura Bell Bundy', 'Young Sarah', '04/10/1981', 2);

INSERT INTO actors (name, character_name, date_of_birth, movieid) VALUES ('Walter Matthau', 'Max Goldman', '10/01/1920', 3),
  ('Jack Lemmon', 'John Gustafson', '02/08/1925', 3), ('Sophia Loren', 'Maria Sophia Coletta Ragetti', '10/20/1934', 3),
   ('Ann-Margret', 'Ariel Gustafson', '04/28/1941', 3), ('Burgess Meredith', 'Grandpa Gustafson', '11/16/1907', 3),
   ('Daryl Hannah', 'Melanie Gustafson', '12/03/1960', 3), ('Kevin Pollack', 'Jacob Goldman', '10/30/1957', 3),
   ('Katie Sagona', 'Allie Gustafson', '11/26/1989', 3), ('Ann Morgan Guilbert', 'Mama Ragetti', '10/16/1928', 3),
   ('James Andelin', 'Sven', '10/27/1917', 3);

--Create a new column in the movie table to hold the MPAA rating. UPDATE 5 different movies to their correct rating

ALTER TABLE public.movies ADD mpaa_rating INT NULL;

UPDATE movies
SET mpaa_rating = 'PG'
WHERE movieid = 1;

UPDATE movies
SET mpaa_rating = 'R'
WHERE movieid = 2;

UPDATE movies
SET mpaa_rating = 'PG-13'
WHERE movieid = 3;

UPDATE movies
SET mpaa_rating = 'PG'
WHERE movieid = 4;

UPDATE movies
SET mpaa_rating = 'ZZZZ'
WHERE movieid = 5;


/*Check results.

SELECT *
FROM movies
  ORDER BY movieid ASC
LIMIT 10;*/



