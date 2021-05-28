USE AdventureWorks2019;
Go
SELECT DISTINCT [OrderDate],[DueDate],[ShipDate] FROM [Sales].[SalesOrderHeader];

SELECT[SalesOrderDetailID],[OrderQty],[ProductID],[UnitPrice],[CustomerID],[LineTotal],[ShipDate] FROM [Sales].[SalesOrderHeader] A
INNER JOIN [Sales].[SalesOrderDetail] B
ON A.SalesOrderID = B.SalesOrderID;

SELECT * FROM [Sales].[SalesOrderDetail];
SELECT * FROM Production.Product;
SELECT * FROM [Sales].[SalesOrderHeader];

SELECT *
FROM [Sales].[SalesOrderDetail] A 
INNER JOIN [Sales].[SalesOrderHeader] B
ON A.SalesOrderID = B.SalesOrderID

