/*
Name: Micheal Andrew
Course: IT143
Assignment: 3.4 AdventureWorks – Create Answers

Description:
This script answers 8 business and metadata questions using the AdventureWorks database.

Estimated Runtime: 1–2 minutes
*/

-- Make sure you SELECT AdventureWorks database from dropdown before running

-- Q1 (Marginal) – Author: Micheal
SELECT TOP 5 
    p.Name, 
    p.ListPrice
FROM Production.Product p
ORDER BY p.ListPrice DESC;


-- Q2 (Marginal) – Author: Micheal
SELECT 
    p.Name, 
    p.StandardCost
FROM Production.Product p
WHERE p.StandardCost > 1000;


-- Q3 (Moderate) – Author: Classmate
SELECT 
    p.Name, 
    SUM(sod.OrderQty) AS TotalQuantitySold
FROM Sales.SalesOrderDetail sod
INNER JOIN Production.Product p 
    ON sod.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY TotalQuantitySold DESC;


-- Q4 (Moderate) – Author: Classmate
SELECT 
    c.CustomerID,
    COUNT(soh.SalesOrderID) AS TotalOrders,
    SUM(soh.TotalDue) AS TotalSpent
FROM Sales.Customer c
INNER JOIN Sales.SalesOrderHeader soh 
    ON c.CustomerID = soh.CustomerID
GROUP BY c.CustomerID
ORDER BY TotalOrders DESC;


-- Q5 (Increased) – Author: Classmate
SELECT 
    MONTH(soh.OrderDate) AS OrderMonth,
    p.Name,
    SUM(sod.OrderQty) AS QuantitySold,
    SUM(sod.LineTotal) AS TotalRevenue
FROM Sales.SalesOrderDetail sod
INNER JOIN Production.Product p 
    ON sod.ProductID = p.ProductID
INNER JOIN Sales.SalesOrderHeader soh 
    ON sod.SalesOrderID = soh.SalesOrderID
WHERE p.Name LIKE '%Bike%'
GROUP BY MONTH(soh.OrderDate), p.Name
ORDER BY OrderMonth;


-- Q6 (Increased) – Author: Classmate
SELECT 
    p.Name,
    p.ListPrice,
    p.StandardCost,
    (p.ListPrice - p.StandardCost) AS Profit
FROM Production.Product p
ORDER BY Profit DESC;


-- Q7 (Metadata) – Author: Classmate
SELECT 
    TABLE_NAME, 
    COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'ProductID';


-- Q8 (Metadata) – Author: Classmate
SELECT 
    TABLE_NAME, 
    COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME IN ('CustomerID', 'AccountNumber');