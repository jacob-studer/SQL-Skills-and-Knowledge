--if we sold every product for its list price for each product with
--a ListPrice greater than $0. That is, if you summed the product of each product’s inventory by
--its list price, what would that value be? 


select sum(p.ListPrice * i.Quantity)
from Production.product p 
join Production.ProductInventory i
on i.ProductID = p.ProductID
where ListPrice > 0