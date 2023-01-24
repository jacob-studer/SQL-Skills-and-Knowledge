--I want to see All sales from January of 2008, From Territory ID 4, Where SalesReason ID = 2
-- I Want to see all sales from January of 2008, That were sold in the Southwestern United States, 
-- and they were sold because they were on promotion, please provide all relevent information 
use AdventureWorks2012

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
