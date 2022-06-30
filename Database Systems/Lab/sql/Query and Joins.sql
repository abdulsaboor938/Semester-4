-- This is the implementation of SQL queries and SQL Joins
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------

select column1 as c1 -- selects columns and renaming the output
from tablename -- from what table (this can also be a combination from multiple tables)
where condition=TRUE or condition like 'true' -- this is to specify the selection condition for the table

---------------------------------------------------------------------------------------------------------------
-- between condition
select S.cgpa from [students] S
where S.cgpa between 2 and 4
-- where S.cgpa between '2' and '4'
---------------------------------------------------------------------------------------------------------------
-- like operations are used for searching specifics in text
-- 'a%' -- value that starts with a
-- '%a' -- value that ends with a
-- '%a%' -- value that have a in any position
-- '_r%' -- value that have r in second position
-- 'a_%_%' -- value that starts with a and has atleast 3 characters in length
-- 'a%o' -- value that starts with a and ends with o
---------------------------------------------------------------------------------------------------------------
-- Table Joins
-- union,intersect,except work on similar columns from two selections
-- here columns should be of same type
select column11, column12
from table1
union--/intersect/except
select column21,column22
from table2
---------------------------------------------------------------------------------------------------------------
-- join operations
select * from table1
join table2 on table1.c1=table2.c2
-- now we can apply regular where, groupby and having clauses
-- types of joins:
    -- inner join only returns the ones matching in both tables
    -- left/right/full outer joins return all the rows of given table and corresponding or null rows of other table
    -- cross join is like taking cartesian product of two tables
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
-- Some useful functions in sql
-- Distinct
--% eliminates duplicated.
Select Distinct Departments from students

-- Like
--% for Any string of zero or more characters.
Select * from students where studentName like '%ed%'
-- _  for Any single character.
Select * from students where studentName like 'Ahm_d'
--[] for Any single character within the specified range ([a-f]) or set ([abcdef]).
select * From Students where studentName like 'Ahm[ae]d'
--[^] for Any single character not within the specified range ([a-f]) or set ([abcdef]).
select * From Students where studentName like 'Ahm[^a]d'

-- is null/ is not null
select * from Course where InstructorID is null
select * from Course where InstructorID is not null

-- between
select * From Students where studentId between 1 and 10
select * From Orders  where orderDate between '2-2-2001' and '2-2-2010'
select *, year(orderDate)  as Year From Orders  where year(orderDate) between 2001 and 2010

-- Some usefull functions
isNull(col,value) – replces the null entry with value
CAST ( expression AS data_type )
CONVERT ( data_type, expression)

-- DATE FUNCTIONS
DATEPART(datepart, date)  --returns the datepart of date
Year(date)-- returns the Year of date 
Month(date) --returns month of  date  
Day(date) --returns Day from  date 
DATEDIFF ( datepart , startdate , enddate ) –-returns the difference in start and end date in datepart (eg year,days ,months)

-- STRING FUNCTIONS
UPPER(String) 
LOWER(String		
LEFT(String,7) -- returns left 7 Characters		
RIGHT(String,7) 
LEN(String)			
LTRIM (String) -- Trim the left end of string
RTRIM(String)				
SUBSTRING (String, 8, 7) 
CHARINDEX ('demo', String) –will return the starting index of ‘demo’ in String	
REPLACE (String,'s','$') REVERSE (String)
---------------------------------------------------------------------------------------------------------------
-- The general syntax is 
SELECT *
FROM tablename
WHERE condition=true
group BY column
HAVING count(*)>condition
order BY columns
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
-- exists clause is used to check if the result returns rows or NOT