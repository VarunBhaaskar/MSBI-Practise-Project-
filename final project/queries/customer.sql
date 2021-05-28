USE AdventureWorks2019
GO

SELECT  B.BusinessEntityID,E.PersonID, E.CustomerID,E.TerritoryID, FirstName, LastName,F.[Name] as State,G.[Name] as Country,[AddressLine1],[City],[PostalCode]
FROM [Sales].[CreditCard] A
INNER JOIN [Sales].[PersonCreditCard] B
ON A.CreditCardID = B.CreditCardID
INNER JOIN [Person].[Person] C
ON C.BusinessEntityID = B.BusinessEntityID
INNER JOIN [Sales].[SalesOrderHeader] D
ON D.CreditCardID=A.CreditCardID
INNER JOIN [Sales].[Customer] E 
on E.CustomerID = D.CustomerID
INNER JOIN [Person].[StateProvince] F
ON F.TerritoryID = E.TerritoryID
INNER JOIN [Person].[CountryRegion] G
ON G.CountryRegionCode = F.CountryRegionCode
INNER JOIN [Person].[Address] H
ON H.StateProvinceID = F.StateProvinceID;


SELECT  *
FROM [Sales].[CreditCard] A
INNER JOIN [Sales].[PersonCreditCard] B
ON A.CreditCardID = B.CreditCardID
INNER JOIN [Person].[Person] C
ON C.BusinessEntityID = B.BusinessEntityID;
Go

SELECT DISTINCT CustomerID FROM Sales.SalesOrderHeader;
Go

SELECT DISTINCT A.PersonID, B.CustomerID FROM Sales.Customer A
RIGHT OUTER JOIN Sales.SalesOrderHeader B
ON A.CustomerID = B.CustomerID
ORDER BY A.PersonID;
Go

SELECT BusinessEntityID FROm Person.Person ORDER BY 1;


SELECT DISTINCT B.BusinessEntityID, C.CustomerID FROM Sales.CreditCard A
RIGHT JOIN Sales.PersonCreditCard B
ON A.CreditCardID = B.CreditCardID
RIGHT JOIN Sales.SalesOrderHeader C
ON A.CreditCardID = C.CreditCardID
ORDER BY B.BusinessEntityID;
Go


SELECT DISTINCT A.PersonID, B.CustomerID FROM Sales.Customer A
RIGHT OUTER JOIN Sales.SalesOrderHeader B
ON A.CustomerID = B.CustomerID
ORDER BY A.PersonID;
Go

SELECT DISTINCT A.BusinessEntityID, B.CustomerID,[FirstName],[LastName],[City],[PostalCode], D.Name as country, H.Name as state
FROm Person.Person A
LEFT JOIn Sales.Customer B
ON A.BusinessEntityID = B.PersonID
LEFT JOIN Sales.SalesTerritory C
ON C.TerritoryID = B.TerritoryID
LEFT JOIN Person.CountryRegion D
ON C.CountryRegionCode = D.CountryRegionCode
LEFT JOIN Person.BusinessEntity E
ON E.BusinessEntityID = A.BusinessEntityID
LEFT JOIN Person.BusinessEntityAddress F
ON F.BusinessEntityID = E.BusinessEntityID
LEFT JOIN Person.Address G
ON G.AddressID = F.AddressID
LEFT JOIN Person.StateProvince H
ON H.StateProvinceID = G.StateProvinceID

ORDER BY A.BusinessEntityID;
go

SELECT DISTINCT A.BusinessEntityID, A.FirstName, A.LastName, G.City, G.PostalCode, D.Name AS country, H.Name AS state, G.AddressLine1
FROM     Person.Person AS A LEFT OUTER JOIN
                  Sales.Customer AS B ON A.BusinessEntityID = B.PersonID LEFT OUTER JOIN
                  --Sales.SalesTerritory AS C ON C.TerritoryID = B.TerritoryID LEFT OUTER JOIN
                  Person.CountryRegion AS D ON C.CountryRegionCode = D.CountryRegionCode LEFT OUTER JOIN
                  --Person.BusinessEntity AS E ON E.BusinessEntityID = A.BusinessEntityID LEFT OUTER JOIN
                  Person.BusinessEntityAddress AS F ON F.BusinessEntityID = A.BusinessEntityID LEFT JOIN
                  Person.Address AS G ON G.AddressID = F.AddressID LEFT OUTER JOIN
                  Person.StateProvince AS H ON H.StateProvinceID = G.StateProvinceID

ORDER BY A.BusinessEntityID
Go

SELECT  A.BusinessEntityID, A.FirstName, A.LastName, D.City, D.PostalCode, F.Name AS country, E.Name AS state,D.AddressLine1
FROM     Person.Person AS A LEFT OUTER JOIN
                  Sales.Customer AS B ON A.BusinessEntityID = B.PersonID LEFT OUTER JOIN
				  Person.BusinessEntityAddress AS C ON C.BusinessEntityID = A.BusinessEntityID LEFT JOIN
				  Person.Address AS D ON D.AddressID = C.AddressID LEFT OUTER JOIN
				  Person.StateProvince AS E ON E.StateProvinceID = D.StateProvinceID LEFT JOIN
				  Person.CountryRegion AS F ON F.CountryRegionCode = E.CountryRegionCode
ORDER BY A.BusinessEntityID;
Go


-- 25/5/2021

SELECT DISTINCT A.BusinessEntityID,B.CustomerID,A.FirstName,A.LastName,C.BillToAddressID
FROM Person.Person A
 LEFT JOIN Sales.Customer  B ON A.BusinessEntityID = B.PersonID
 LEFT JOIN Sales.SalesOrderHeader C ON C.CustomerID = B.CustomerID

 






 

