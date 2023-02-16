--Write an SQL query that reports the spending of each user.
--Return the resulting table ordered by spending in descending order. --In case of a tie, order them by user_id in ascending order.

--The query result format is in the following example.

with t1 
as (
	select s.user_id as user_id, p.product_id, s.quantity, p.price,  s.quantity*p.price as 'pricetotal'
	from Product p 
	join sales s
	on p.product_id = s.product_id
),

t2 as (
	select sum(pricetotal) as 'spending', user_id
	from t1
	group by user_id
)

select user_id, spending
from t2
order by spending desc, user_id asc

--refactored

select
    s.user_id,
    sum(s.quantity * p.price) as spending
from
    sales s
    join product p
    on s.product_id=p.product_id
group by
    s.user_id
order by
    spending desc,
    s.user_id asc
