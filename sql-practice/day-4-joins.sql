-- 1. Film title with its language name (INNER JOIN)
SELECT f.title, l.name AS language_name
FROM film f
INNER JOIN language l ON f.language_id = l.language_id;
LIMIT 10;

-- 2. Count of films per language (GROUP BY + JOIN)
SELECT l.name AS language_name, COUNT(*) AS film_count
FROM film f
INNER JOIN language l ON f.language_id = l.language_id
GROUP BY l.name;
LIMIT 10;

-- 3. Customer details with there total rental amount (JOIN + SUM)
SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS name, SUM(p.amount) AS total_spent
FROM customer c
INNER JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 10;

-- 4. Films that have no inventory (LEFT JOIN with NULL check)
SELECT f.title, i.inventory_id
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
WHERE i.inventory_id IS NULL
LIMIT 10;

-- 5. Top 5 actors jo who appeared in most films (JOIN + COUNT + GROUP BY)
SELECT a.actor_id, CONCAT(a.first_name, ' ', a.last_name) AS actor_name, COUNT(fa.film_id) AS film_count
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY film_count DESC
LIMIT 5;