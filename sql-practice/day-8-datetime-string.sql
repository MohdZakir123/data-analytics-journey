-- DAY 8: DATE/TIME & STRING FUNCTIONS
-- Dataset: online_retail

-- 1. Extract YEAR, MONTH, DAY from InvoiceDate
SELECT 
    InvoiceNo,
    InvoiceDate,
    YEAR(InvoiceDate) AS invoice_year,
    MONTH(InvoiceDate) AS invoice_month,
    DAY(InvoiceDate) AS invoice_day
FROM online_retail
LIMIT 10;

-- 2. UPPER, LOWER, LENGTH on Description
SELECT 
    Description,
    UPPER(Description) AS description_upper,
    LOWER(Description) AS description_lower,
    LENGTH(Description) AS desc_length
FROM online_retail
WHERE Description IS NOT NULL
LIMIT 10;

-- 3. SUBSTRING: Extract first 10 characters from Description
SELECT 
    Description,
    SUBSTRING(Description, 1, 10) AS first_10_chars
FROM online_retail
WHERE Description IS NOT NULL
LIMIT 10;


-- 4. CONCAT + DATE_FORMAT
SELECT 
    InvoiceNo,
    CONCAT('UK-', InvoiceNo) AS uk_invoice_no,
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS year_month,
    DATE_FORMAT(InvoiceDate, '%W, %M %d, %Y') AS full_date
FROM online_retail
LIMIT 10;


-- 5. STR_TO_DATE + DATEDIFF + TRIM
SELECT 
    InvoiceNo,
    STR_TO_DATE('2025-01-15', '%Y-%m-%d') AS example_date,
    DATEDIFF(STR_TO_DATE('2025-12-31', '%Y-%m-%d'), STR_TO_DATE('2025-01-01', '%Y-%m-%d')) AS days_diff,
    TRIM('   hello world   ') AS trimmed_string,
    LENGTH('   hello world   ') AS original_length,
    LENGTH(TRIM('   hello world   ')) AS trimmed_length
FROM online_retail
LIMIT 1;
-- hello world 