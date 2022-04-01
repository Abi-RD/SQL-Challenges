# Q1. List all actors.
SELECT * FROM actor;

# Q2. Find the surname of the actor with the forename 'John'.
SELECT last_name FROM actor WHERE first_name = 'John';

# Q3. Find all actors with surname 'Neeson'.
SELECT * FROM actor WHERE last_name = 'Neeson';

# Q4. Find all actors with ID numbers divisible by 10.
SELECT * FROM actor WHERE (actor_id %10) = 0;

# Q5. What is the DESCription of the movie with an ID of 100?
SELECT `DESCription` FROM film WHERE film_id = 100;

# Q6. Find every R-rated movie.
SELECT title FROM film WHERE rating = 'R';

# Q7. Find every non-R-rated movie.
SELECT title FROM film WHERE rating != 'R';

# Q8. Find the ten shortest movies.
SELECT title FROM film ORDER BY length ASC LIMIT 10;

# Q9. Find the movies with the longest runtime, without using LIMIT.
SELECT title, length FROM film WHERE length = (SELECT max(length) FROM film);

# Q10. Find all movies that have deleted scenes.
SELECT title FROM film WHERE special_features LIKE '%Deleted Scenes%';

# Q11. Using HAVING, reverse-alphabetically list the last names that are not repeated.
SELECT last_name FROM actor GROUP BY last_name HAVING COUNT(last_name) = 1 ORDER BY last_name DESC;

# Q12. Using HAVING, list the last names that appear more than once, FROM highest to lowest frequency.
SELECT last_name FROM actor GROUP BY last_name HAVING COUNT(last_name) != 1 ORDER BY COUNT(last_name) DESC;

# Q13. Which actor has appeared in the most films?
SELECT actor.first_name, actor.last_name FROM film_actor 
JOIN actor ON actor.actor_id = film_actor.actor_id
GROUP BY film_actor.actor_id ORDER BY COUNT(DISTINCT film_id) DESC LIMIT 1;

# Q14. When is 'Academy Dinosaur' due?
SELECT film.title, DATE_ADD(rental.rental_date, INTERVAL film.rental_duration DAY)
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON rental.inventory_id = inventory.inventory_id
WHERE film.title = "Academy Dinosaur"
AND rental.return_date IS NULL;

# Q15. What is the average runtime of all films?
SELECT AVG(length) FROM film;

# Q16. List the average runtime for every film category.
SELECT film_category.category_id, AVG(film.length) FROM film
JOIN film_category ON film_category.film_id = film.film_id
GROUP BY film_category.category_id;

# Q17. List all movies featuring a robot.
SELECT `DESCription` FROM film WHERE `DESCription` LIKE '%Robot%';

# Q18. How many movies were released in 2010?
SELECT COUNT(film_id) FROM film WHERE release_year = '2010';

# Q19. Find the titles of all the horror movies.
SELECT film.title FROM film
JOIN film_category ON film_category.film_id=film.film_id
JOIN category ON category.category_id=film_category.category_id
WHERE category.`name`='Horror';

# Q20. List the full name of the staff member with the ID of 2.
SELECT first_name, last_name FROM staff WHERE staff_id=2;

# Q21. List all the movies that Fred Costner has appeared in.
SELECT film.title FROM actor
JOIN film_actor ON film_actor.actor_id=actor.actor_id
JOIN film ON film.film_id=film_actor.film_id
WHERE actor.first_name='Fred' and actor.last_name = 'Costner';

# Q22. How many distinct countries are there?
SELECT count(distinct country) FROM country;

# Q23. List the name of every language in reverse-alphabetical order.
SELECT `name` FROM `language` order by `name` DESC;

# Q24. List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename.
SELECT first_name, last_name FROM actor WHERE last_name like '%son' order by first_name ASC;

# Q25. Which category contains the most films?
SELECT category.`name`, count(film_category.film_id) FROM category
JOIN film_category ON film_category.category_id=category.category_id
GROUP BY film_category.category_id
ORDER BY film_category.category_id LIMIT 1;


