/*
Author: Michael Andrew
Date: 2026-04-17
Assignment: 6.4 Performance Analysis
Description: Demonstrates execution plans and missing index recommendations
*/

-- =========================================
-- QUERY 1 (Before Index)
-- =========================================
-- Turn on execution plan in SSMS (Ctrl + M)

SELECT *
FROM Person.Person
WHERE FirstName = 'John';

-- =========================================
-- NOTE:
-- Check Execution Plan:
-- Look for:
-- 1. Table Scan (bad for performance)
-- 2. Missing Index Recommendation
-- 3. Estimated Subtree Cost
-- =========================================


-- =========================================
-- CREATE INDEX (Based on Recommendation)
-- =========================================
CREATE NONCLUSTERED INDEX idx_firstname
ON Person.Person (FirstName);

-- =========================================
-- QUERY 1 (After Index)
-- =========================================
SELECT *
FROM Person.Person
WHERE FirstName = 'John';

-- =========================================
-- QUERY 2 (Second Table)
-- =========================================

SELECT *
FROM Production.Product
WHERE Name = 'Blade';

-- =========================================
-- CREATE INDEX FOR SECOND QUERY
-- =========================================
CREATE NONCLUSTERED INDEX idx_product_name
ON Production.Product (Name);

-- =========================================
-- QUERY 2 (After Index)
-- =========================================
SELECT *
FROM Production.Product
WHERE Name = 'Blade';


-- NOTES:
-- Compare execution plans before and after:
-- Lower subtree cost
-- Index Seek instead of Table Scan
-- Faster query performance.