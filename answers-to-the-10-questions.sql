-- Week 5 - Monday Questions
-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT COUNT(last_name)
FROM actor
WHERE last_name = 'Wahlberg';
-- Answer: 2

-- 2. How many payments were made between $3.99 and $5.99?
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 and 5.99;
-- Answer: 5607

-- 3. What film does the store have the most of? (search in inventory)
SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;
-- Answer: It's a tie.  There are many (72) movies with a count of 8. film_id: 192 is one of them.

-- 4. How many customers have the last name ‘William’?
SELECT last_name
FROM customer
WHERE last_name LIKE 'William%';
-- Answer: 0, however there is 1 customer with the last name Williams and 1 with last name Williamson.

-- 5. What store employee (get the id) sold the most rentals?
SELECT *
FROM staff;

SELECT *
FROM rental;

SELECT staff_id, COUNT(staff_id)
FROM rental
GROUP BY staff_id
ORDER BY staff_id;
-- Answer: It was close, however the employee with staff_id 1 (Mike Hillyer), sold 8040; 36 more than
--			the employee with staff_id 2 (Jon Stephens).


-- 6. How many different district names are there?
SELECT *
FROM address;

SELECT COUNT(DISTINCT(district))
FROM address;
-- Answer: 378

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT *
FROM film_actor;

SELECT film_id, COUNT(film_id) as film_id_count
FROM film_actor
GROUP BY film_id
ORDER BY film_id_count DESC;
-- Answer: film_id 508 has the most actors at 15.  Next best are films with 13 actors in them--there are 6 such films.

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT SUM(store_id)
FROM customer
WHERE last_name LIKE '%es' AND store_id = 1;
-- Answer: 13

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- 		with ids between 380 and 430? (use group by and having > 250)
SELECT *
FROM payment;


SELECT amount, COUNT(rental_id)
FROM payment
WHERE customer_id BETWEEN 380 and 430
GROUP BY amount
HAVING COUNT(rental_id) > 250;
-- Answer: 3

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- 		movies total?
SELECT *
FROM film;

SELECT film.rating, COUNT(rating)
FROM film
GROUP BY film.rating
ORDER BY COUNT(rating) DESC;
-- Answer: 5 rating categories.  PG-13 has the most at 223 movies.