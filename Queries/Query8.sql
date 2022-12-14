--Find the total sales for each territory in the year 2006. Using the NTILE() function, split them
--into two groups, include the Sales Territory Name and also its Country Region Name.
--Also, complete a CASE statement that takes the result of the NTILE()
--function and assigns the value “Top Territory Group” when the NTILE() value is 1 and “Bottom
--Territory Group” when the NTILE() value is 2.

with TerritorySales
as (
	select 
		cr.Name as [CountryRegion],
		st.Name as [Territory],
		sum(soh.TotalDue) as [TotalSales]
	from sales.SalesOrderHeader soh
	join sales.SalesTerritory st
	on st.TerritoryID = soh.TerritoryID
	join person.CountryRegion cr
	on cr.CountryRegionCode = st.CountryRegionCode
	where year(soh.OrderDate) = 2006
	group by st.Name, cr.Name
),
Territory_ntile AS (
	select 
		CountryRegion,
		Territory,
		TotalSales,
	ntile(2) over(order by TotalSales desc) as TerritoryTierNumber
	from TerritorySales
)
select 
	CountryRegion,
	Territory,
	CASE
		WHEN TerritoryTierNumber = 1 THEN 'Top Territory Group'
		WHEN TerritoryTierNumber = 2 THEN 'Bottom Territory Group'
	END AS TerritoryCaseTier
from Territory_ntile



