--Write an SQL query to find the most recent order(s) of each product.

--Return the result table ordered by product_name in ascending order and in case of a tie 
--by the product_id in ascending order. If there still a tie, order them by order_id in 
--ascending order.



with recentorderdate
as (
	select max(order_date) as orderdate, product_id
	from Orders
	group by product_id
),

orderstable as (
	select o.product_id, o.order_id, o.order_date
	from orders o
	join recentorderdate rod
	on rod.product_id=o.product_id and rod.orderdate=o.order_date
)

select p.product_name, p.product_id, ot.order_id, ot.order_date
from Products p
join orderstable ot on o.product_id=p.product_id
order by p.product_name asc, p.product_id asc, ot.order_id asc

