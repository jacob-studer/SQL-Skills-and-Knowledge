--Write an SQL query to report the name and the mail of all interview candidates. 
--A user is an interview candidate if at least one of these two conditions is true:

--The user won any medal in three or more consecutive contests.
--The user won the gold medal in three or more different contests (not necessarily consecutive).

with t1 
as (
    select gold_medal
    from contests
    group by gold_medal
    having count(contest_id) >=3
)

t2 as (
	select contest_id, gold_medal as user_id
	from contests
	union all
	select contest_id, silver_medal
	from contests
	union all
	select contest_id, bronze_medal
	from contests
)

select * from contests