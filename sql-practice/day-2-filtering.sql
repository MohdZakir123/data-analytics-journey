-- Day 2: WHERE clause with AND, OR, IN, BETWEEN, LIKE
SELECT * FROM employees WHERE salary > 50000 AND departmant = 'IT';

-- 2. OR Operator
SELECT * FROM products WHERE price < 100 OR category = 'Electoronics';

--3. IN operator
SELECT * FROM customers WHERE city IN ('Bangalore', 'Mumbai', 'Hyderabad');

-- 4. BETWEEN operator
SELECT * FROM orders WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31';

-- 5. LIKE operator (starts with 'A')
SELECT * FROM employees WHERE name LIKE 'A&';