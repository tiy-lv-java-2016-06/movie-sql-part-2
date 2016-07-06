--Get the average rating for a movie
SELECT avg(rating)
FROM ratings
WHERE movieid = 485;

--Get the total ratings for a movie
SELECT count(rating)
FROM ratings
WHERE movieid = 485;

--Get the total movies for a genre
SELECT count(movieid)
FROM movies
WHERE genres LIKE 'Comedy%';

--Get the average rating for a user
SELECT avg(rating)
FROM ratings
WHERE userid = 22;

--Find the user with the most ratings
SELECT userid, count(rating)
FROM ratings
GROUP BY userid, rating
Order BY count(ratings.rating) DESC;

--Find the user with the highest average rating
SELECT userid, avg(rating)
FROM ratings
GROUP BY userid, rating
ORDER BY avg(ratings.rating) DESC;

--Find the user with the highest average rating with more than 50 reviews
SELECT userid, avg(ratings.rating), count(ratings.rating)
FROM ratings
GROUP BY userid, rating
HAVING count(rating) > 50
ORDER BY avg(ratings.rating)DESC;

--Find the movies with an average rating over 4
SELECT movies.title, avg(ratings.rating)
FROM movies
  JOIN ratings ON movies.movieid = ratings.movieid
GROUP BY movies.movieid
HAVING avg(ratings.rating) > 4
ORDER BY avg(ratings.rating) DESC;

--For each genre find the total number of reviews as well as the average review sort by highest average review.
SELECT genre.genres, count(ratings.rating), avg(ratings.rating)
FROM genre
  LEFT JOIN movies ON genre.genres = movies.genres
  LEFT JOIN ratings ON movies.movieid = ratings.movieid
GROUP BY genre.genres
ORDER BY avg(ratings.rating) DESC;

/*
Create a new table called actors (We are going to pretend the actor can only play in one movie)
The table should include name, character name, foreign key to movies and date of birth at least plus an id field.
*/
CREATE TABLE public.actors
(
    id INTEGER NOT NULL,
    name VARCHAR NOT NULL,
    character_name VARCHAR NOT NULL,
    date_of_birth DATE NOT NULL,
    movieid INTEGER NOT NULL,
    CONSTRAINT actors_movies_movieid_fk FOREIGN KEY (movieid) REFERENCES movies (movieid)
);

--Pick 3 movies and create insert statements for 10 actors each. You should use the multi value insert statements
INSERT INTO actors(movieid, name, character_name, date_of_birth)
VALUES (1, 'Tom Hanks', 'Woody', '10-31-70'), (1, 'Tim Allen', 'Buzz', '4-23-72'), (1, 'Don Rickles', 'Mr. Potato Head', '2-12-64'),
  (1, 'Jim Varney', 'The Dog', '6-12-71'), (1,'Wallace Shawn', 'Rex', '11-1-55'), (1, 'John Ratz', 'Hamm', '3-22-79'),
  (1,'Annie Potts', 'Bo Peep', '12-1-76'), (1,'John Morris', 'Soldier', '5-5-67'), (1, 'Henry Smith', 'Evil Boy', '8-21-66'),
  (1, 'Erik Von', 'Racecar', '7-13-62');

INSERT INTO actors(movieid, name, character_name, date_of_birth) VALUES (2, 'Al Rock', 'Strange Man', '1-12-50'),
  (2, 'Noah Lee', 'Bruce', '3-1-44'), (2, 'Vince V', 'The Cat', '4-4-50'), (2, 'Kathy Ray', 'The Poor Girl', '6-5-70'),
  (2, 'Ricky Bobby', 'Ricky Bobby', '1-1-90'), (2, 'Mike O', 'Sam I Am', '9-9-55'), (2, 'Tim Ann', 'The Rock', '2-6-49'),
  (2, 'Rick James', 'Rick James', '12-20-79'), (2, 'Omar Smith', 'Ozzy', '6-17-68'), (2, 'Ej Wills', 'Willy', '2-1-41');

INSERT INTO actors(movieid, name, character_name, date_of_birth) VALUES (3, 'Fred Way', 'Freddy', '1-12-36'),
  (3, 'Manny Zee', 'The Shark', '4-5-55'), (3, 'William Jay', 'Kenny', '10-11-90'), (3, 'James Lou', 'Louis', '3-1-44'),
  (3, 'Marky Mark', 'Truck Driver', '2-21-80'), (3, 'Frank Lee', 'Willy', '5-1-87'), (3, 'Rocky Tim', 'Crazy Greg', '11-12-76'),
  (3, 'Tim Wey', 'Big Ben', '6-3-79'), (3, 'John Free', 'Gym Owner', '4-29-67'), (3, 'Leo Way', 'Sad Child', '9-10-66');

SELECT *
FROM actors;

--Create a new column in the movie table to hold the MPAA rating. UPDATE 5 different movies to their correct rating
SELECT *
FROM movies
WHERE movieid < 6;

UPDATE movies
SET mpaa = 'G'
WHERE movieid = 1;

UPDATE movies
SET mpaa = 'PG'
WHERE movieid = 2;

UPDATE movies
SET mpaa = 'PG-13'
WHERE movieid = 3;

UPDATE movies
SET mpaa = 'R'
WHERE movieid = 4;

UPDATE movies
SET mpaa = 'PG'
WHERE movieid = 5;
