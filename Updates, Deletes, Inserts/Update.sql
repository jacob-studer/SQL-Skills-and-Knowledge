--Update file
-- We have sale that was the incorrect amount that we are not able to update in the front end, we are receiving an error when trying to do so.
--Please update orderID 75113 Subtotal to $234.29, make sure that all connecting tables are also updated.

use AdventureWorks2012

update Sales.SalesOrderHeader
set SubTotal to 234.29
where orderID = 75113