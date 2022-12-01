--built in sql server functions

--Starting with the string “This is a slightly longer string”, find the last eight characters and then,
--from that result, find the first four characters. In other words, find the first four characters of
--the last eight characters from the string “This is a slightly longer string”. (Hint: use a nested
--function for this query)

select left(right('This is a slightly longer string', 8), 4)

--Find the string that results from finding all characters to left of and including the first “e” in each
--FirstName from Person.Person. Only return those results where the resulting string is not blank.
--(Hint: this will be challenging. Use a nested function in the SELECT statement and then that
--same nested function in the WHERE clause)

SELECT
LEFT(FirstName, CHARINDEX('e', FirstName, 0))
FROM Person.Person
WHERE LEFT(FirstName, CHARINDEX('e', FirstName, 0)) <> ''



--How many months are between December 25, 1993 and the date that is 2,719 days before
--today’s date?

SELECT DATEDIFF(MONTH,'12/25/1993', DATEADD(DAY, -2719, GETDATE()))



--If the MiddleName column is NULL then return the FirstName and LastName concatenated. If
--the MiddleName is non-NULL then return the FirstName, MiddleName and LastName
--concatenated.
SELECT
COALESCE(FirstName + ' ' + MiddleName + ' ' + LastName,
FirstName + ' ' + LastName) AS FullName
FROM Person.Person

--Using the Production.Product table, if the MakeFlag and FinishedGoodsFlag columns are equal
--then return a NULL value.
SELECT NULLIF(MakeFlag, FinishedGoodsFlag)
FROM Production.product
