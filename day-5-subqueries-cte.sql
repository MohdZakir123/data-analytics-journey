-- 1. Subquery in WHERE: Customers who spent more than average

SELECT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > (SELECT AVG(amount) FROM payment);

-- 2. Subquery with IN: Films that have never been rented-- 

SELECT title
FROM title 
WHERE film_id NOT IN (SELECT DISTINCT film_id FROM inventory); 

-- 3. Subquery in FROM: Average revenue per customer

SELECT AVG(customer_total) AS avg_customer_revenue
FROM (
SELECT customer_id, SUM(amount) AS customer_total
FROM payment
GROUP BY customer_id
)
AS cust_totals;

-- 4. CTE (WITH clause): Top 5 customers by spending

WITH customer_spending AS (
SELECT customer_id, SUM(amount) AS total
FROM payment
GROUP BY customer_id
)
SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS name, cs.total
FROM customer c
JOIN customer_spending cs ON c.customer_id = cs.customer_id
ORDER BY cs.total DESC
LIMIT 5;

-- 5. CTE + Subquery: Filmas with above-average rental count
-- USE sakila;-- 
WITH film_rentals AS (
SELECT f.film_id, f.title, COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id
)
SELECT  title, rental_count
FROM film_rentals
WHERE rental_count > (SELECT AVG(rental_count) FROM film_rentals);