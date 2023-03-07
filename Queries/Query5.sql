--Return the Name column from Production.Product and assign
--it the column alias “Product Name”. For each product, find out how many of each product was
--ordered for all orders that occurred in 2006. Only output those products where at least 200
--were ordered.

SELECT
    P.Name AS [Product Name],
    SUM(SOD.OrderQty) AS ProductOrderCount
FROM Sales.SalesOrderHeader SOH
INNER JOIN Sales.SalesOrderDetail SOD
ON SOD.SalesOrderID = SOH.SalesOrderID
INNER JOIN Production.Product P
ON P.ProductID = SOD.ProductID
WHERE SOH.OrderDate BETWEEN '1/1/2006' AND '12/31/2006'
GROUP BY P.Name
HAVING SUM(SOD.OrderQty) >= 200
