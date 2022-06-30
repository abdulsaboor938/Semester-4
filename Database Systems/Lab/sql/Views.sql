-- This is the implementation of sql views

-- The thing to keep in mind in views is to first run a query and then make it into a view

create view view1 as
    select * from tablename where condition=TRUE
go

-- this is to alter the view after creation
alter view view1 AS
    select column1 from tablename where condition=TRUE
go

create view view1 as
    select * from tablename where condition=TRUE
    with check option -- this is to prevent any updates to the database from the given view
go
