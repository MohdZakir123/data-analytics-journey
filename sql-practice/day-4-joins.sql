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