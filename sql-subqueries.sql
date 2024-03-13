USE sakila;

-- 1) Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.

SELECT f.title AS Title, SUM(i.film_id) FROM sakila.inventory AS i
JOIN sakila.film AS f
ON f.film_id = i.film_id
GROUP BY Title;

-- 2) List all films whose length is longer than the average length of all the films in the Sakila database.

SELECT title, ROUND(AVG(length),2) AS 'Average' FROM sakila.film
GROUP BY title
HAVING Average > (SELECT ROUND(AVG(length)) AS 'Average1' FROM sakila.film)
ORDER BY Average;

-- 3) Use a subquery to display all actors who appear in the film "Alone Trip".

SELECT first_name, last_name FROM sakila.actor
WHERE actor_id in (SELECT actor_id FROM sakila.film_actor
WHERE film_id in (SELECT film_id
FROM sakila.film 
WHERE title = "Alone Trip"
));