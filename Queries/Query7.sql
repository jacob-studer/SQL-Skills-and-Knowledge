--Find out how many sales in Sales.SalesOrderHeader fell into the following ranges: “$0 to
--$149.99”, “$150 – 499.99”, “$500 to $4,999.99”, “$5,000 - $24,999.99”, and “Over $25,000”.
--Only analyze sales that had a sales person associated with them

WITH SalesRanges
AS (
	SELECT
		CASE
			WHEN TotalDue BETWEEN 0 AND 149.99
			THEN '$0 to $149.99'
			WHEN TotalDue BETWEEN 150 AND 499.99
			THEN '$150 to $499.99'
			WHEN TotalDue BETWEEN 500 AND 4999.99
			THEN '$500 to $4,999.99'
			WHEN TotalDue BETWEEN 5000 AND 24999.99
			THEN '$5,000 to $24,999.99'
			ELSE 'Over $25,000'
		END AS SalesPriceRange,
		SalesOrderID
	FROM Sales.SalesOrderHeader
)
SELECT
	SalesPriceRange,
	COUNT(*)
FROM SalesRanges
GROUP BY SalesPriceRange