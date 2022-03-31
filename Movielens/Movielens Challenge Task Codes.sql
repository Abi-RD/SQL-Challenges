USE movielens;

SELECT title, release_date FROM movies WHERE YEAR(release_date) BETWEEN '1983' and '1993' ORDER BY release_date DESC;

SELECT movies.title, avg(rating) FROM ratings
join movies on movies.id = ratings.movie_id 
group by movies.id having avg(rating)=min(rating) and count(movies.id)=1 order by avg(rating); 

SELECT movies.id, min(rating) FROM ratings
join movies on movies.id = ratings.movie_id 
group by movies.id ;



SELECT movie_id, avg(rating) FROM ratings group by movie_id having avg(rating)=min(avg(rating))  ;

select distinct title, ratings.rating, genres.name, users.gender, users.age, occupations.name from movies
join ratings on ratings.movie_id = movies.id
join genres_movies on genres_movies.movie_id=movies.id
join genres on genres.id=genres_movies.genre_id
join users on users.id= ratings.user_id
join occupations on occupations.id=users.occupation_id
where ratings.rating=5 and genres_movies.genre_id=15 and users.gender='M' and users.age=24 and users.occupation_id=19;

select distinct title from	 movies where release_date = (select  release_date from movies group by release_date order by count(release_date) desc limit 1);
-- (select  release_date, count(release_date) from movies group by release_date order by count(release_date) desc limit 1);

SELECT genre_id, COUNT(movie_id) FROM genres_movies GROUP BY genre_id ORDER BY genre_id, COUNT(movie_id) ASC;