--Using a subquery, find all employees who have an address based in California. 

SELECT *
FROM HumanResources.Employee
WHERE BusinessEntityID IN (
SELECT E.BusinessEntityID
FROM HumanResources.Employee E
INNER JOIN Person.BusinessEntityAddress BEA
ON BEA.BusinessEntityID = E.BusinessEntityID
INNER JOIN Person.[Address] A
ON A.AddressID = BEA.AddressID
INNER JOIN Person.StateProvince SP
ON SP.StateProvinceID = A.StateProvinceID
WHERE SP.Name = 'California'
)