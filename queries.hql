-- ============================================
-- Customer Behaviour Analysis - Hive Queries
-- BITE411L | VIT Vellore | Winter 2025-26
-- ============================================

-- Step 1: Create External Table pointing to HDFS
CREATE EXTERNAL TABLE IF NOT EXISTS customers_new (
    CustomerID      INT,
    Name            STRING,
    Age             INT,
    Gender          STRING,
    City            STRING,
    State           STRING,
    AccountBalance  DOUBLE,
    TransactionAmount DOUBLE,
    TransactionType STRING,
    TransactionTime STRING,
    FraudLabel      INT,
    DeviceType      STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/customer_data/'
TBLPROPERTIES ("skip.header.line.count"="1");

-- ============================================
-- 1. Total Customers
-- ============================================
SELECT COUNT(DISTINCT CustomerID) AS total_customers
FROM customers_new;

-- ============================================
-- 2. Average Transaction Amount
-- ============================================
SELECT AVG(TransactionAmount) AS avg_transaction
FROM customers_new;

-- ============================================
-- 3. State-wise Transaction Activity
-- ============================================
SELECT State, COUNT(*) AS total_transactions
FROM customers_new
GROUP BY State
ORDER BY total_transactions DESC;

-- ============================================
-- 4. Age Group Behaviour
-- ============================================
SELECT
    CASE
        WHEN Age < 25 THEN 'Young'
        WHEN Age BETWEEN 25 AND 45 THEN 'Middle'
        ELSE 'Senior'
    END AS AgeGroup,
    COUNT(*) AS total_transactions,
    AVG(TransactionAmount) AS avg_spending
FROM customers_new
GROUP BY
    CASE
        WHEN Age < 25 THEN 'Young'
        WHEN Age BETWEEN 25 AND 45 THEN 'Middle'
        ELSE 'Senior'
    END;

-- ============================================
-- 5. Device Usage Pattern
-- ============================================
SELECT DeviceType, COUNT(*) AS usage_count
FROM customers_new
GROUP BY DeviceType
ORDER BY usage_count DESC;

-- ============================================
-- 6. Most Preferred Transaction Type
-- ============================================
SELECT TransactionType, COUNT(*) AS usage_count
FROM customers_new
GROUP BY TransactionType
ORDER BY usage_count DESC;

-- ============================================
-- 7. City-wise Fraud Analysis
-- ============================================
SELECT City, COUNT(*) AS fraud_count
FROM customers_new
WHERE FraudLabel = 1
GROUP BY City
ORDER BY fraud_count DESC;

-- ============================================
-- 8. High Value Fraud Transactions
-- ============================================
SELECT *
FROM customers_new
WHERE TransactionAmount > 30000 AND FraudLabel = 1
LIMIT 10;

-- ============================================
-- 9. Top Customers by Transaction Amount
-- ============================================
SELECT CustomerID, Name, TransactionAmount
FROM customers_new
ORDER BY TransactionAmount DESC
LIMIT 10;

-- ============================================
-- 10. Gender-wise Spending Analysis
-- ============================================
SELECT Gender,
       COUNT(*) AS total_transactions,
       AVG(TransactionAmount) AS avg_spending,
       SUM(TransactionAmount) AS total_spending
FROM customers_new
GROUP BY Gender;
