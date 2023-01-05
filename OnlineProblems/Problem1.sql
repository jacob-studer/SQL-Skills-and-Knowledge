--Each row of this table contains an email.
--Write an SQL query to report all the duplicate emails.



with EmailCountTable
as (
    select email, 
    count(*) as EmailCount
    from Person
    group by email
    having count(*) > 1
)
select email as Email 
from EmailCountTable
where EmailCount > 1