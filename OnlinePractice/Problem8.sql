--Write an SQL query to find the type of weather in each country for November 2019.
--The type of weather is:
--Cold if the average weather_state is less than or equal 15,
--Hot if the average weather_state is greater than or equal to 25, and
--Warm otherwise.
--Return result table in any order.

with t1
as (
	select 
		avg(weather_state) as 'weather_avg',
		country_id
	from weather
	where day between '2019-11-01' and '2019-11-30'
	group by country_id
)

select
	c.country_name,
	case
			when w.weather_avg <= 15
				then 'Cold'
			when w.weather_avg >= 25
				then 'Hot'
			else 'Warm'
		end as weather_type
	from Countries c
	join t1 w 
	on c.country_id = w.country_id

	
