--joins

--Return the Name and ListPrice columns from Production.Product. For each product, regardless
--of whether or not it has an assigned ProductSubcategoryID, return the Name column from
--Product.ProductSubcategory for each product. Then, return the Name column from
--Production.ProductCategory for each row. Give the Name column from Production.Product the
--alias “ProductName”, the Name column from Production.ProductSubcategory the alias
--“ProductSubcategoryName”, and the Name column from Production.ProductCategory the alias
--“ProductCategoryName”. Order the results by the “ProductCategoryName” in descending order
--and then the “ProductSubcategoryName” in ascending order.

select 
	p.Name as [ProductName], 
	p.ListPrice, 
	psc.Name as [ProductSubcategoryName], 
	--psc.ProductSubcategoryID, 
	pc.Name as [ProductCategoryName]
from Production.Product p
left outer join Production.ProductSubcategory psc
on psc.ProductSubcategoryID = p.ProductSubcategoryID 
left outer join production.ProductCategory pc
on pc.ProductCategoryID = psc.ProductCategoryID 
order by ProductCategoryName desc, ProductSubcategoryName asc

