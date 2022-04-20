-- This is a comprehensive guide for Lab Mids

-- DDL
-- DML
-- Queries
-- Nested Queries and operations
-- Variables and Stored Procedures

-- DDl
use master
create database labmid

use labmid
create table t1(
    rollnum int not null PRIMARY key,
    name varchar(20) not null
)

create table t2(
    s_no int IDENTITY(1,1),
    rnum int not null, -- FOREIGN key references t1(rollnum) on update cascade on delete no ACTION,
    dob date not null
)

-- inserting data into tables
insert into t1
VALUES(1234,'saboor'),
(1233,'Abdul')

insert into t2 VALUES
(1233,'2002-1-17') -- date to begiven in year-month-day format

-- DML starts here
alter table t2 add constraint pk_t2 primary key(rnum)
alter table t2 add constraint fk_t2 foreign key(rnum) references t1(rollnum) on update cascade on delete no action

alter table t2 add col1 int not null default 3 -- you can not have not null constraint without default parameter
select * from t2

alter table t2 drop column col1 -- for dropping a column

alter table t2 alter column col1 int not null

-- updating
update t1 set [name]='abdul' where rollnum=1223
update t2 set rnum=1113 where rnum=1233

use labmid
select * from t1

use labmid
truncate table t2
select * from t2

Alter Table Student add constraint UNIQUE_CONSTRAINT_STUDENT_CNIC Unique (cnic,name)

-- check constraint
cgpa float NULL check (cgpa>=0 AND cgpa<=4),
or
check (cgpa>=0 AND cgpa<=4)

-- adding constraint later on
alter table Student add constraint DEFAULT_SUDENT_CGPA default 0 for CGPA

-- DML part

-- inserting values into table
-- selecting values from table
-- deleting from table
delete from t1
where [name]='abdul'

delete from t1  -- no condition deletes all rows, same as truncate command

update t1
set name='abdul',att2='val2'
where att='val'

-- SQL commands
select *
from t1
where rollnum between 3 and 4

-- like operations are used for searching specifics in text
-- 'a%' -- value that starts with a
-- '%a' -- value that ends with a
-- '%a%' -- value that have a in any position
-- '_r%' -- value that have r in second position
-- 'a_%_%' -- value that starts with a and has atleast 3 characters in length
-- 'a%o' -- value that starts with a and ends with o

select col1, col2
from table1
union/intersect/EXCEPT
select col1,col2
from table2

select distinct col1 -- this gives distinct values of given column
from t1

-- Like

-- --% for Any string of zero or more characters.
-- Select * from students where studentName like '%ed%'
-- -- _  for Any single character.
-- Select * from students where studentName like 'Ahm_d'
-- --[] for Any single character within the specified range ([a-f]) or set ([abcdef]).
-- select * From Students where studentName like 'Ahm[ae]d'
-- --[^] for Any single character not within the specified range ([a-f]) or set ([abcdef]).
-- select * From Students where studentName like 'Ahm[^a]d'

-- is null/ is not null

-- select * from Course where InstructorID is null
-- select * from Course where InstructorID is not null

-- between

-- select * From Students where studentId between 1 and 10
-- select * From Orders  where orderDate between '2-2-2001' and '2-2-2010'
-- select *, year(orderDate)  as Year From Orders  where year(orderDate) between 2001 and 2010

-- Some usefull functions

-- isNull(col,value) – replces the null entry with value
-- CAST ( expression AS data_type )
-- CONVERT ( data_type, expression)

-- DATE FUNCTIONS

-- DATEPART(datepart, date)  --returns the datepart of date
-- Year(date)-- returns the Year of date 
-- Month(date) --returns month of  date  
-- Day(date) --returns Day from  date 
-- DATEDIFF ( datepart , startdate , enddate ) –-returns the difference in start and end date in datepart (eg year,days ,months)

-- STRING FUNCTIONS

-- UPPER(String) 
-- LOWER(String		
-- LEFT(String,7) -- returns left 7 Characters		
-- RIGHT(String,7) 
-- LEN(String)			
-- LTRIM (String) -- Trim the left end of string
-- RTRIM(String)				
-- SUBSTRING (String, 8, 7) 
-- CHARINDEX ('demo', String) –will return the starting index of ‘demo’ in String	
-- REPLACE (String,'s','$') REVERSE (String) 

-- SQL Joins
inner JOIN,
left JOIN,
right JOIN,
full join / full outer JOIN
cross join -- this is the cross product syntax in sql

use lab5
create view view_1 AS
select O.OrderNo as [Order Number], sum(I.Price*O.Quantity) as [Price]
from [dbo].[OrderDetails] as O join [dbo].[Items] as I on O.ItemNo=I.ItemNo
group by O.OrderNo
with check option -- this prevents us from altering a view
select * from view_1
select * from view_2

insert into view_1 values ('C8','SABOOR','LHR',777777) -- this should not be allowed in with check option

alter procedure test_1 -- this is the syntax to create a basic procedure
as
BEGIN
    select * from view_1
END

execute dbo.test_1 -- this is the syntax to run a basic procedure
