--Create a date variable called “MaxOrderDate”. Set the value of “MaxOrderDate” equal to the
--most recent date from the OrderDate column in the Sales.SalesOrderHeader table. Write a
--SELECT statement that returns all rows from Sales.SalesOrderHeader where the OrderDate
--equals the “MaxOrderDate” variable

declare @MaxOrderDate date = (
	select 
		max(OrderDate)
	from 
		sales.SalesOrderHeader
)

select * 
from sales.SalesOrderHeader
where OrderDate = @MaxOrderDate