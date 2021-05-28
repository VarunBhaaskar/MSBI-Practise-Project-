select DISTINCT [TerritoryID],A.[Name] as Territory_Name, [Group] as CountryGroup, B.Name as country_name
FROM [Sales].[SalesTerritory] A
INNER JOIN [Person].[CountryRegion] B
ON A.CountryRegionCode = B.CountryRegionCode;


USE AdventureWorks2019;
Go


