-- Abdul Saboor
-- 20L-1113
-- BDS-4A


-- use master
-- go
-- drop  database ATM
-- go
-- Create database ATM
-- go
-- use ATM
-- go
-- create Table UserType(
-- userTypeID int primary key,
-- [name] varchar(20) not null
-- )
-- go
-- create table [User](
-- [userId] int primary key,
-- [name] varchar(20) not null,
-- [userType] int foreign key references UserType(UserTypeID),
-- [phoneNum] varchar(15) not null,
-- [city] varchar(20) not null
-- )
-- go
--
-- create table CardType(
-- [cardTypeID] int primary key,
-- [name] varchar(15),
-- [description] varchar(40) null
-- )
-- go
-- create Table [Card](
-- cardNum Varchar(20) primary key,
-- cardTypeID int foreign key references  CardType([cardTypeID]),
-- PIN varchar(4) not null,
-- [expireDate] date not null,
-- balance float not null
-- )
-- go
--
--
-- Create table UserCard(
-- userID int foreign key references [User]([userId]),
-- cardNum varchar(20) foreign key references [Card](cardNum),
-- primary key(cardNum)
-- )
-- go
-- create table TransactionType(
-- transTypeID int primary key,
-- typeName varchar(20) not null,
-- [description] varchar (40) null
-- )
-- go
-- create table [Transaction](
-- transId int primary key,
-- transDate date not null,
-- cardNum varchar(20) foreign key references [Card](cardNum),
-- amount int not null,
-- transType int foreign key references TransactionType(transTypeID)
-- )
--
--
--
--
-- GO
-- INSERT [dbo].[UserType] ([userTypeID], [name]) VALUES (1, N'Silver')
-- GO
-- INSERT [dbo].[UserType] ([userTypeID], [name]) VALUES (2, N'Gold')
-- GO
-- INSERT [dbo].[UserType] ([userTypeID], [name]) VALUES (3, N'Bronze')
-- GO
-- INSERT [dbo].[UserType] ([userTypeID], [name]) VALUES (4, N'Common')
-- GO
-- INSERT [dbo].[User] ([userId], [name], [userType], [phoneNum], [city]) VALUES (1, N'Ali', 2, N'03036067000', N'Narowal')
-- GO
-- INSERT [dbo].[User] ([userId], [name], [userType], [phoneNum], [city]) VALUES (2, N'Ahmed', 1, N'03036047000', N'Lahore')
-- GO
-- INSERT [dbo].[User] ([userId], [name], [userType], [phoneNum], [city]) VALUES (3, N'Aqeel', 3, N'03036063000', N'Karachi')
-- GO
-- INSERT [dbo].[User] ([userId], [name], [userType], [phoneNum], [city]) VALUES (4, N'Usman', 4, N'03036062000', N'Sialkot')
-- GO
-- INSERT [dbo].[User] ([userId], [name], [userType], [phoneNum], [city]) VALUES (5, N'Hafeez', 2, N'03036061000', N'Lahore')
-- GO
-- INSERT [dbo].[CardType] ([cardTypeID], [name], [description]) VALUES (1, N'Debit', N'Spend Now, Pay Now')
-- GO
-- INSERT [dbo].[CardType] ([cardTypeID], [name], [description]) VALUES (2, N'Credit', N'Spend Now, Pay later')
-- GO
-- INSERT [dbo].[CardType] ([cardTypeID], [name], [description]) VALUES (3, N'Gift', N'Enjoy')
-- GO
-- INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'1324327436569', 3, N'1770', CAST(N'2022-07-01' AS Date), 43025.31)
-- GO
-- INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'2324325423336', 3, N'0234', CAST(N'2020-03-02' AS Date), 14425.62)
-- GO
-- INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'2324325436566', 1, N'1234', CAST(N'2019-02-06' AS Date), 34325.52)
-- GO
-- INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'2324325666456', 2, N'1200', CAST(N'2021-02-05' AS Date), 24325.3)
-- GO
-- INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'2343243253436', 2, N'0034', CAST(N'2020-09-02' AS Date), 34025.12)
-- GO
--
-- INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (1, N'1324327436569')
-- GO
-- INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (1, N'2343243253436')
-- GO
-- INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (2, N'2324325423336')
-- GO
-- INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (3, N'2324325436566')
-- GO
-- INSERT [dbo].[TransactionType] ([transTypeID], [typeName], [description]) VALUES (1, N'Withdraw', NULL)
-- GO
-- INSERT [dbo].[TransactionType] ([transTypeID], [typeName], [description]) VALUES (2, N'Deposit', NULL)
-- GO
-- INSERT [dbo].[TransactionType] ([transTypeID], [typeName], [description]) VALUES (3, N'ScheduledDeposit', NULL)
-- GO
-- INSERT [dbo].[TransactionType] ([transTypeID], [typeName], [description]) VALUES (4, N'Failed', NULL)
-- GO
-- INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (1, CAST(N'2017-02-02' AS Date), N'1324327436569', 500, 1)
-- GO
-- INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (2, CAST(N'2018-02-03' AS Date), N'2343243253436', 3000, 3)
-- GO
-- INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (3, CAST(N'2017-05-06' AS Date), N'2324325436566', 2500, 2)
-- GO
-- INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (4, CAST(N'2016-09-09' AS Date), N'2324325436566', 2000, 1)
-- GO
-- INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (5, CAST(N'2015-02-10' AS Date), N'2324325423336', 6000, 4)
-- GO
--
--
-- Select * from UserType
-- Select * from [User]
-- Select * from UserCard
-- Select * from [Card]
-- Select * from CardType
-- Select * from [Transaction]
-- Select * from TransactionType

-- Lab tasks start from here

-- Create a procedure to display all the user�s details.
create procedure user_details
as begin
    select * from [dbo].[User]
end
execute user_details

-- Create a procedure that takes user name and display his details.
create procedure user_detail_name
@name varchar(20)
as
begin
    select * from [dbo].[User] as U where U.name=@name
end
execute user_detail_name @name='Ali'


-- Create a procedure that takes card number and display owner�s name, phone number and city.
create procedure task_3
@cardnum varchar(20)
as
begin
    select U.name,U.phoneNum,U.city from [dbo].[User] U join [dbo].[Usercard] UC on U.userId=UC.userID
    where UC.cardNum=@cardnum
end
execute task_3 @cardnum=1324327436569


-- Create a procedure that returns minimum balance in an output parameter.
create procedure task_4
@minbal float output
as
begin
    select @minbal=balance from [dbo].[Card] order by balance desc
end

declare @bal float
execute task_4 @minbal=@bal output
select @bal as [lowest balance]

drop procedure task_4

-- Create a procedure that takes user name, id and returns no. of cards of that user in an output parameter.
create procedure task_5
@name varchar(20),@userid int,@count int output
as
begin
    select @count=count(*) from [dbo].[User] U join [dbo].[UserCard] UC on U.userId=UC.userID
    where U.userId=@userid and U.name=@name
    group by U.UserId
end

declare @num int
execute task_5 @name='Ali', @userid=1, @count=@num output
select @num as #cards


-- Create a procedure Login that takes card number, PIN and returns the status in an output
-- parameter. @status =1 if card number and PIN is valid and @status=0 otherwise.
create procedure Login
@cardnum varchar(20),@pin varchar(4), @status int output
as
begin
    if (exists (select * from [dbo].[Card] C where C.cardNum=@cardnum and C.PIN=@pin))
    begin
        set @status=1
    end
    else
    begin
        set @status=0
    end
end


declare @stat int
execute Login @cardnum=1324327436569, @pin=1770, @status=@stat output
select @stat as Status-- returns true

declare @stat int
execute Login @cardnum=1324327436569, @pin=1771, @status=@stat output
select @stat as Status -- returns false


-- Create a procedure to update the PIN. The procedure takes Card Number, old PIN and new Valid
-- PIN (Length 4) and print �Updated PIN� if PIN gets updated or �Error� otherwise.
-- (Google it if you don�t know how to compare the Length).
create procedure updatePin
@cardnum varchar(20), @oldpin varchar(4), @newpin varchar(4)
as
begin
    if (exists (select * from [dbo].[Card] C where C.cardNum=@cardnum and C.PIN=@oldpin))
    begin
        if(LEN(@newpin)=4)
        begin
            update [dbo].[Card]
            set PIN=@newpin
            where cardNum=@cardnum and PIN=@oldpin
            print 'Updated PIN'
        end
        else
        begin
            print 'Error'
        end
    end
    else
    begin
        print 'Error'
    end
end

execute UpdatePin 1324327436569,1770,177 -- error
execute UpdatePin 1324327436569,1770,1771 -- updates pin
execute UpdatePin 1324327436569,1770,1771 -- error


-- Create a procedure WithDraw using Login Procedure (Question#6), the procedure will take
-- Card Number, PIN, amount for transaction. Now insert detail of the transaction in Transaction
-- Table if the transaction is successful with TransType =1(successful Transaction) and next transID
-- (calculate the max transID and increment transID, then insert in table). If the transaction fails
-- insert TransType=4 (Failed Transaction). Update the balance against the card number
-- accordingly.
--create procedure WithDraw
--@cardnum varchar(20), @pin varchar(4), @amount float
--as
--begin
--    declare @temp int
--    execute Login @cardnum,@pin, @temp output
--    if (@temp=1) -- check remaining balance
--    begin -- update transaction and balance
--        print('Success')
--    end
--    else -- update a failed transaction
--    begin
--        print('Failure')
--    end
--end
--drop procedure WithDraw

create procedure WithDraw
@CardNum varchar(20),
@pin varchar(4),
@amount float
as
begin
	declare @Date date -- for current date
	declare @transId int
	declare @exist float
	select @transId =  max(transId) from [Transaction] -- max id
	set @transId = @transId + 1 -- incrementing by 1
	set @Date = getdate()
	select @exist = C.balance -- checking balance
	from [Card] C
	where C.cardNum = @cardNum and C.PIN = @pin

	declare @status int

	execute [Login] @cardNum, @pin, @status output
	if (@status = 1 and @exist >= @amount) -- if successful
	begin
		insert into [Transaction]
		values (@TransId, @Date, @cardNum, @amount, 1)
		update [Card]
		set balance = balance - @amount
		where [Card].cardNum = @cardNum and [Card].PIN = @pin
	end
	else -- if not successful
		begin
		insert into [Transaction]
		values (@TransId, @Date, @cardNum, @amount, 4)
	end
end
go

execute WithDraw 1324327436569,1770, 2000

-- creating a procedure for showing the working of a while loop
create procedure while_test
as
begin
    declare @count int
    set @count=0
    while(@abc<5)
    begin

        print @abc -- or do anything inside loop

    set@abc=@abc+1
    end

end

-- sql variables
-- •	Variable in SQL start with @ symbol
-- •	Variable is declared using DECLARE keyword as follow
DECLARE @variableName datatype;
-- Or to declare multiple variables in one statement. 
DECLARE @variable1Name Datatype,@variable2Name  datatype;
-- •	Variable can be assigned a constant scalar value as follow
SET  @ variableName   = value;
-- Or To assign values to multiple variables in one statement 
select @ variable1Name    = value, @variable2Name  =value;
-- •	Variable can be assigned a scalar value thought SQL statement as well
SELECT @vairableName = columnName FROM Table WHERE  <condition>
-- If SQL query returns more than one row, 1st value will be assigned to variable
-- •	You can retrieve the value of variable as follow
Select @variableName
-- •	You can perform operations on variables like addition, concatenation, substring etc 
