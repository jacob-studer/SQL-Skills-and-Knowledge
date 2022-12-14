--Update file
-- We have sale that was the incorrect amount that we are not able to update in the front end, we are receiving an error when trying to do so.
--Please update orderID 75113 Subtotal to $234.29, make sure that all connecting tables are also updated.

use AdventureWorks2012

update Sales.SalesOrderHeader
set SubTotal = 234.29
where SalesOrderID = 75113

--It turns out that that order is invalid, and we need to delete it before the next business day as it could cause problems in payment processing.

use AdventureWorks2012

delete from Sales.SalesOrderHeader
where SubTotal = 234.29
and SalesOrderID = 75113
