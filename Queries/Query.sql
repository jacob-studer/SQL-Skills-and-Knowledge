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
select * from Sales.SpecialOffer

--Need to start from SalesOrderHeader, select all OrderID's that have an Order date between 01-01 01-31, 2008
--Selecting all that have a Territory ID of 4, join the SalesTerritory table so you can include all relevent info for territory
--Join the SalesOrderHeaderSalesReason table so taht you can filter by SalesReasonID
--Join SalesReason so you can provide the necessary info about the SalesReason

--Knowlton Querying search for FK placement of SalesPerson FK_SalesPerson_Employee_BusinessEntityID