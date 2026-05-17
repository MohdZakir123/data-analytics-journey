-- Day 7: CASE Statements (if-else logic in SQL)

-- 1. Simple CASE: Categorize orders by quantity
SELECT InvoiceNo, Quantity,
       CASE 
           WHEN Quantity > 100 THEN 'High Volume'
           WHEN Quantity BETWEEN 20 AND 100 THEN 'Medium Volume'
           WHEN Quantity BETWEEN 1 AND 19 THEN 'Low Volume'
           ELSE 'Zero or Negative'
       END AS volume_category
FROM online_retail
LIMIT 20;

-- 2. CASE with GROUP BY: Count of orders per volume category
SELECT 
       CASE 
           WHEN Quantity > 100 THEN 'High Volume'
           WHEN Quantity BETWEEN 20 AND 100 THEN 'Medium Volume'
           WHEN Quantity BETWEEN 1 AND 19 THEN 'Low Volume'
           ELSE 'Zero or Negative'
       END AS volume_category,
       COUNT(*) AS order_count
FROM online_retail
GROUP BY volume_category;

-- 3. CASE in aggregation: Revenue from high vs low quantity orders
SELECT 
       SUM(CASE WHEN Quantity > 50 THEN Quantity * UnitPrice ELSE 0 END) AS high_quantity_revenue,
       SUM(CASE WHEN Quantity <= 50 THEN Quantity * UnitPrice ELSE 0 END) AS low_quantity_revenue
FROM online_retail;

-- 4. CASE to flag null CustomerID
SELECT InvoiceNo, CustomerID,
       CASE 
           WHEN CustomerID IS NULL THEN 'Unknown Customer'
           ELSE 'Known Customer'
       END AS customer_status
FROM online_retail
LIMIT 20;

-- 5. CASE with multiple conditions and ELSE
SELECT InvoiceNo, Quantity, UnitPrice,
       CASE 
           WHEN Quantity * UnitPrice > 5000 THEN 'Premium Order'
           WHEN Quantity * UnitPrice BETWEEN 1000 AND 5000 THEN 'Regular Order'
           WHEN Quantity * UnitPrice < 1000 AND Quantity > 10 THEN 'Bulk Discount Order'
           ELSE 'Small Order'
       END AS order_tier
FROM online_retail
LIMIT 20;