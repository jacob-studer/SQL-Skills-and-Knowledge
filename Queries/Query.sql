--user story: I want to see All sales from January of 2008, From Territory ID 4, Where SalesReason ID = 2
-- I Want to see all sales from January of 2008, That were sold in the Southwestern United States, 
-- and they were sold because they were on promotion, please provide all relevent information 
use AdventureWorks2012

--select * from Sales.SalesOrderDetail
--select * from Sales.SalesOrderHeader
--select * from Sales.SalesOrderHeaderSalesReason
--select * from Sales.SalesReason
--select * from Sales.SalesPerson
--select * from Sales.SalesTaxRate
--select * from Sales.SalesTerritory
--select * from Sales.SalesTerritory
--select * from Sales.SpecialOffer

--Next include the sales person, try to find some other stuff that is more difficult to join

--Knowlton Querying search for FK placement of SalesPerson FK_SalesPerson_Employee_BusinessEntityID

SELECT 
	SOH.SalesOrderID AS [Sales Order ID], 
	SOH.OrderDate AS [Order Date], 
	ST.Name AS [Territory],
	ST.CountryRegionCode AS [Country],
	SR.Name AS [Sales Reason]
FROM 
	Sales.SalesOrderHeader SOH
INNER JOIN
	Sales.SalesTerritory ST ON ST.TerritoryID = SOH.TerritoryID	
INNER JOIN 
	Sales.SalesOrderHeaderSalesReason HSR ON HSR.SalesOrderID = SOH.SalesOrderID
INNER JOIN 
	Sales.SalesReason SR ON SR.SalesReasonID = HSR.SalesReasonID
WHERE 
	(SOH.OrderDate BETWEEN '2008-01-01' AND '2008-01-31') 
	AND ST.TerritoryID = 4
	AND HSR.SalesReasonID = 2