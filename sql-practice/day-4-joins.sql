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

