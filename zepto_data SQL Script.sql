CREATE DATABASE zepto_analysis;

USE zepto_analysis;

CREATE TABLE zepto_data (
    Date DATE,
    ProductID VARCHAR(100),
    ProductName VARCHAR(100),
    Category VARCHAR(100),
    UnitPrice DECIMAL(10,2),
    StockQuantity INT,
    StockValue DECIMAL(12,2),
    ReorderLevel INT,
    ReorderQuantity INT,
    UnitsSold INT,
    SalesValue DECIMAL(12,2),
    LastSoldDate DATE,
    LastRestockDate DATE,
    NextRestockDate DATE,
    DeliveryTimeDays INT,
    DeliveryStatus VARCHAR(50)
);
SHOW TABLES;

select * from zepto_data;

SELECT COUNT(*)
FROM zepto_data;


ALTER TABLE zepto_data
CHANGE COLUMN `ï»¿Date` `OrderDate` DATE;


ALTER TABLE zepto_data
CHANGE COLUMN `Ã¯Â»Â¿Date` `Date` DATE;


SELECT
    SUM(Orderdate IS NULL) AS missing_date,
    SUM(ProductID IS NULL) AS missing_product_id,
    SUM(ProductName IS NULL) AS missing_product,
    SUM(Category IS NULL) AS missing_category,
    SUM(UnitPrice IS NULL) AS missing_price,
    SUM(StockQuantity IS NULL) AS missing_stock,
    SUM(UnitsSold IS NULL) AS missing_units,
    SUM(SalesValue IS NULL) AS missing_sales,
    SUM(LastSoldDate IS NULL) AS missing_last_sold
FROM zepto_data;

SELECT *
FROM zepto_data
WHERE UnitPrice < 0
   OR StockQuantity < 0
   OR StockValue < 0
   OR ReorderLevel < 0
   OR ReorderQuantity < 0
   OR UnitsSold < 0
   OR SalesValue < 0
   OR DeliveryTimeDays < 0;
 
 ALTER TABLE zepto_data
ADD COLUMN InventoryStatus VARCHAR(30);

SET SQL_SAFE_UPDATES = 0;
 
UPDATE zepto_data
SET InventoryStatus =
    CASE
        WHEN StockQuantity <= ReorderLevel
            THEN 'Reorder Required'
        WHEN StockQuantity <= ReorderLevel * 2
            THEN 'Low Stock'
        ELSE 'Healthy Stock'
    END
WHERE ProductID IS NOT NULL;

ALTER TABLE zepto_data
ADD COLUMN SalesPerformance VARCHAR(30);

UPDATE zepto_data
SET SalesPerformance =
    CASE
        WHEN UnitsSold = 0 THEN 'No Sales'
        WHEN UnitsSold >= 100 THEN 'High Performer'
        WHEN UnitsSold >= 50 THEN 'Medium Performer'
        ELSE 'Low Performer'
    END;

ALTER TABLE zepto_data
ADD COLUMN StockDays DECIMAL(10,2);

UPDATE zepto_data
SET StockDays =
    CASE
        WHEN UnitsSold > 0
        THEN (StockQuantity / UnitsSold) * 30
        ELSE NULL
    END;
    
    SELECT
    SUM(SalesValue) AS TotalSales,
    SUM(UnitsSold) AS TotalUnitsSold,
    SUM(StockQuantity) AS TotalStock,
    SUM(StockValue) AS TotalInventoryValue,
    AVG(UnitPrice) AS AverageUnitPrice,
    AVG(DeliveryTimeDays) AS AverageDeliveryTime
FROM zepto_data;

SELECT
    Category,
    ROUND(SUM(SalesValue), 2) AS TotalSales,
    SUM(UnitsSold) AS UnitsSold,
    ROUND(SUM(StockValue), 2) AS InventoryValue,
    COUNT(*) AS Records
FROM zepto_data
GROUP BY Category
ORDER BY TotalSales DESC;

SELECT
    ProductName,
   ROUND(SUM(SalesValue), 2) AS TotalSales,
    SUM(UnitsSold) AS UnitsSold,
    SUM(StockQuantity) AS Stock
FROM zepto_data
GROUP BY ProductName
ORDER BY TotalSales DESC
LIMIT 10;

SELECT
    ProductName,
    Category,
    StockQuantity,
    ReorderLevel,
    ReorderQuantity,
    InventoryStatus
FROM zepto_data
WHERE InventoryStatus = 'Reorder Required'
ORDER BY StockQuantity ASC;

SELECT
    Category,
    COUNT(*) AS ReorderRecords,
    SUM(ReorderQuantity) AS RequiredReorderQty
FROM zepto_data
WHERE InventoryStatus = 'Reorder Required'
GROUP BY Category
ORDER BY ReorderRecords DESC;

SELECT
    DeliveryStatus,
    COUNT(*) AS Orders,
    AVG(DeliveryTimeDays) AS AvgDeliveryDays
FROM zepto_data
GROUP BY DeliveryStatus
ORDER BY Orders DESC;

SELECT
    YEAR(Orderdate) AS Year,
    MONTH(Orderdate) AS Month,
    SUM(SalesValue) AS TotalSales,
    SUM(UnitsSold) AS UnitsSold
FROM zepto_data
GROUP BY YEAR(Orderdate), MONTH(Orderdate)
ORDER BY Year, Month;

SELECT
    ProductName,
    Category,
    StockQuantity,
    StockValue
FROM zepto_data
WHERE UnitsSold = 0
ORDER BY StockValue DESC;