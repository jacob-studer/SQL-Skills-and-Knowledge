--Using Sales.SalesOrderHeader, how many sales occurred in each territory between July 1, 2005
--and December 31, 2006? Order the results by the sale count in descending order.

select soh.TerritoryID, count(soh.SalesOrderID) as [total sales]
from sales.SalesOrderHeader soh
where OrderDate between '2005-07-01 00:00:00.000' and '2006-12-31 00:00:00.000'
group by soh.TerritoryID
order by 1

--group the results not by the TerritoryID but by the name of
--the territory (found in the Sales.SalesTerritory table).

select st.Name [territory name], count(soh.SalesOrderID) as [total sales]
from sales.SalesOrderHeader soh
join sales.SalesTerritory st
on st.TerritoryID = soh.TerritoryID
where OrderDate between '2005-07-01 00:00:00.000' and '2006-12-31 00:00:00.000'
group by st.Name
order by 1