USE Sakila;
SELECT * FROM actor;

SELECT last_name FROM actor WHERE first_name = 'John';

SELECT * FROM actor WHERE last_name = 'Neeson';

SELECT * FROM actor WHERE (actor_id %10) = 0;

SELECT `description` FROM film WHERE film_id = 100;

SELECT title FROM film WHERE rating = 'R';
SELECT title FROM film WHERE rating != 'R';

SELECT title FROM film ORDER BY length ASC LIMIT 10;

SELECT title, length from film where length = (select max(length) from film);  # 2nd select statement represents 185 from table (nested query)-- 

-- SELECT title, Max(length) FROM film ORDER BY MAX(length) DESC;

SELECT title FROM film WHERE special_features LIKE '%Deleted Scenes%';

SELECT last_name FROM actor GROUP BY last_name HAVING COUNT(last_name) = 1 ORDER BY last_name DESC; 	#CAN'T USE ASC or DESC without ORDER BY

SELECT last_name, COUNT(last_name) FROM actor GROUP BY last_name HAVING COUNT(last_name) != 1 ORDER BY COUNT(last_name) DESC;

-- SELECT actor_id, COUNT(DISTINCT film_id) FROM film_actor GROUP BY actor_id ORDER BY COUNT(DISTINCT film_id) DESC LIMIT 1 	-- gives 1st half but need actors `name`-- 

SELECT actor.first_name, actor.last_name FROM film_actor 
JOIN actor ON actor.actor_id = film_actor.actor_id
GROUP BY film_actor.actor_id ORDER BY COUNT(DISTINCT film_id) DESC LIMIT 1;

SELECT release_year FROM film WHERE title = 'ACADEMY DINOSAUR';		

SELECT film_category.category_id, AVG(film.length) FROM film
JOIN film_category ON film_category.film_id = film.film_id
GROUP BY film_category.category_id;

SELECT title FROM film GROUP BY length ORDER BY AVG(length) ;

SELECT `description` FROM film WHERE `description` LIKE '%Robot%';

SELECT COUNT(film_id) FROM film WHERE release_year = '2010';

select film.title, category.name from film
join film_category on film_category.film_id=film.film_id
join category on category.category_id=film_category.category_id
where category.name='Horror';

select first_name, last_name from staff where staff_id=2;

select film.title, actor.first_name, actor.last_name from actor
join film_actor on film_actor.actor_id=actor.actor_id
join film on film.film_id=film_actor.film_id
where actor.first_name='Fred' and actor.last_name = 'Costner';

select count(distinct country) from country;

select name from language order by name desc;

select first_name, last_name from actor where last_name like '%son' order by first_name asc;

select category.name, count(film_category.film_id) from category
join film_category on film_category.category_id=category.category_id
group by film_category.category_id
order by film_category.category_id limit 1;


