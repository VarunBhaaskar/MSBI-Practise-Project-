USE AdventureWorks2019;
Go

SELECT q from
(SELECT ABS(CHECKSUM(56998)) % 37 as q) A;

DECLARE @i INTEGER;
SET @i = 1;
 
WHILE @i <= 505
BEGIN
   INSERT INTO [Production].[Product] (ProductSubcategoryID) Values (ABS(CHECKSUM(NewId())) % 37)
		where (ROW_NUMBER() OVER (ORDER BY ProductID) = i  );
   SET @i = @i + 1;
END;

SELECT ProductID, Name,ProductSubcategoryID, CHECKSUM(ProductID)%38 FROM [Production].[Product];
SELECT* FROM [Production].[ProductSubcategory];


SELECT DISTINCT A.[ProductID],A.[Name],[Color],[Size],[ProductLine],C.[Name]  as sub_category,D.[Name] as Category,E.Name as model 
FROM [Production].[Product] A
LEFT JOIN [Production].[ProductSubcategory] C
ON A.ProductSubcategoryID = C.ProductSubcategoryID
LEFT JOIN [Production].[ProductCategory] D
ON C.ProductCategoryID = D.ProductCategoryID
LEFT JOIN [Production].[ProductModel] E
On E.ProductModelID = A.ProductModelID;


SELECT DISTINCT A.ProductID 
FROM [Production].[Product] A
INNER JOIN [Sales].[SalesOrderDetail] B
ON A.ProductID = B.ProductID
ORDER BY A.ProductID;

SELECT * FROM Production.Product