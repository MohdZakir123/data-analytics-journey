-- 1 Assign a sequential order number to each invoice for each customer using ROW_NUMBER().

SELECT CustomerID, InvoiceNo, InvoiceDate,
       ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY InvoiceDate) AS order_number
FROM online_retail
LIMIT 20;

-- 2 Calculate the total revenue for each country and rank them using RANK() and DENSE_RANK().

SELECT Country, SUM(Quantity * UnitPrice) AS total_revenue,
       RANK() OVER (ORDER BY SUM(Quantity * UnitPrice) DESC) AS revenue_rank,
       DENSE_RANK() OVER (ORDER BY SUM(Quantity * UnitPrice) DESC) AS dense_rank
FROM online_retail
GROUP BY Country
LIMIT 10;

-- 3 Calculate the cumulative revenue for each customer over time using SUM() as a window function.

SELECT CustomerID, InvoiceNo, InvoiceDate, Quantity * UnitPrice AS order_amount,
       LAG(Quantity * UnitPrice) OVER (PARTITION BY CustomerID ORDER BY InvoiceDate) AS prev_order_amount,
       LEAD(Quantity * UnitPrice) OVER (PARTITION BY CustomerID ORDER BY InvoiceDate) AS next_order_amount
FROM online_retail
LIMIT 20;

-- 4 Calculate the running total revenue for each customer over time.

SELECT CustomerID, InvoiceNo, InvoiceDate, Quantity * UnitPrice AS order_amount,
       SUM(Quantity * UnitPrice) OVER (PARTITION BY CustomerID ORDER BY InvoiceDate) AS running_total
FROM online_retail
LIMIT 20;

-- 5 Calculate the average order amount for each customer and rank them within their country using RANK().  

SELECT Country, CustomerID, SUM(Quantity * UnitPrice) AS total_spent,
       RANK() OVER (PARTITION BY Country ORDER BY SUM(Quantity * UnitPrice) DESC) AS rank_in_country
FROM online_retail
GROUP BY Country, CustomerID
LIMIT 20;