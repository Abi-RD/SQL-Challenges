# Q1. List the titles and release dates of movies released between 1983-1993 in reverse chronological order.
SELECT title, release_date FROM movies WHERE YEAR(release_date) BETWEEN '1983' and '1993' ORDER BY release_date DESC;

# Q2. Without using LIMIT, list the titles of the movies with the lowest average rating.
SELECT movies.title, AVG(ratings.rating) AS 'Average Rating' FROM movies
JOIN ratings ON ratings.movie_id = movies.id                  
GROUP BY movies.title
HAVING AVG(ratings.rating) = (
	SELECT MIN(avg_rating) FROM (
		SELECT AVG(ratings.rating) AS avg_rating
        FROM ratings
        GROUP BY movie_id) AS table1);

# Q3. List the unique records for Sci-Fi movies where male 24-year-old students have given 5-star ratings.
SELECT distinct title FROM movies
JOIN ratings ON ratings.movie_id = movies.id
JOIN genres_movies ON genres_movies.movie_id=movies.id
JOIN genres ON genres.id=genres_movies.genre_id
JOIN users ON users.id= ratings.user_id
JOIN occupations ON occupations.id=users.occupation_id
WHERE ratings.rating=5 AND genres_movies.genre_id=15 AND users.gender='M' AND users.age=24 AND users.occupation_id=19;

# Q4. List the unique titles of each of the movies released on the most popular release day.
SELECT DISTINCT title FROM movies 
WHERE release_date = (
    SELECT  release_date FROM movies 
    GROUP BY release_date 
    ORDER BY count(release_date) DESC LIMIT 1);

# Q5. Find the total number of movies in each genre; list the results in ascending numeric order.
SELECT genres.`name`, COUNT(movie_id) FROM genres_movies 
JOIN genres ON genres.id = genres_movies.genre_id
GROUP BY genre_id ORDER BY COUNT(movie_id) ASC; 
