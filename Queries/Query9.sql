--Using the previous example as your foundation, join to the Person.Person table to return the
--sales person’s first name and last name. Now, only include those rows where the territory’s
--name is either “Northeast” or “Central”


SELECT
    P.FirstName,
    P.LastName,
    SP.BusinessEntityID,
    SP.SalesYTD,
    ST.Name AS [Territory Name]
FROM Sales.SalesPerson SP
LEFT OUTER JOIN Sales.SalesTerritory ST
ON ST.TerritoryID = SP.TerritoryID
INNER JOIN Person.Person P
ON P.BusinessEntityID = SP.BusinessEntityID
WHERE ST.Name IN ('Northeast', 'Central')