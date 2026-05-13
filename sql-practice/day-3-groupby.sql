-- Day 3: GROUP BY, HAVING, Aggregates
-- 1. Total orders per country
SELECT Country, COUNT(*) AS TotalOrders FROM online_retail GROUP BY Country;

-- 2. Revenue per country (highest first)
SELECT Country, SUM(Quantity * UnitPrice) AS Revenue FROM online_retail GROUP BY Country ORDER BY Revenue DESC;

-- 3. Countries with more than 1000 orders
SELECT Country, COUNT(*) FROM online_retail GROUP BY Country HAVING COUNT(*) > 1000;

-- 4. Top 10 expensive products (avg price)
SELECT Description, AVG(UnitPrice) AS AvgPrice FROM online_retail GROUP BY Description ORDER BY AvgPrice DESC LIMIT 10;

-- 5. Top 10 customers by total items bought
SELECT CustomerID, SUM(Quantity) AS TotalItems FROM online_retail GROUP BY CustomerID ORDER BY TotalItems DESC LIMIT 10;