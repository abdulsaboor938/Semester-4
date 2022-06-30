-- This is the implementation of database transactions
begin TRANSACTION
select * from tablename
commit or ROLLBACK
---------------------------------------------------------------------------------------------------------------
-- transaction practice on twitter database
use twitter
begin TRANSACTION
INSERT [dbo].[users] (User_ID,[UserName], [Age], [Country],privacy) VALUES (10,N'Saboor', 40, N'USA',1)
select * from [dbo].[Users]
rollback
select * from [dbo].[users]

-- Some things to remember are that we need to have a begin transaction point to rollback a transaction
-- This implies that commits are permanent and we cannot rollback after commit
begin TRANSACTION
select * from [dbo].[users]
COMMIT
ROLLBACK -- this is not possible
---------------------------------------------------------------------------------------------------------------
-- Transactions in stored procedures
-- creating a savepoint for database
create procedure transaction_procedure
@variable1 INT,
@variable2 VARCHAR(20)
as BEGIN
    begin TRANSACTION
    save transaction savepoint1; -- this creates a save point that we can revert to if required

    begin try
        -- an update query
    end TRY
    begin CATCH
        if @@TRANCOUNT>0 -- start rollback
        BEGIN
            rollback transaction savepoint1;
        END
    end catch
    commit TRANSACTION
END
go
---------------------------------------------------------------------------------------------------------------
@@trancount -- this is a variable that gives number of transaction count
@@rowcount -- this is a variable that gives number of changed rows