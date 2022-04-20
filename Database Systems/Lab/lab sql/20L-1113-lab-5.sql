-- create Database Lab5
-- go
-- use Lab5
-- go
-- CREATE TABLE [dbo].[Items](
-- 	[ItemNo] [int] NOT NULL Primary Key,
-- 	[Name] [varchar](10) NULL,
-- 	[Price] [int] NULL,
-- 	[Quantity in Store] [int] NULL
-- )
-- GO
-- INSERT [dbo].[Items] ([ItemNo], [Name], [Price], [Quantity in Store]) VALUES (100, N'A', 1000, 100)
-- INSERT [dbo].[Items] ([ItemNo], [Name], [Price], [Quantity in Store]) VALUES (200, N'B', 2000, 50)
-- INSERT [dbo].[Items] ([ItemNo], [Name], [Price], [Quantity in Store]) VALUES (300, N'C', 3000, 60)
-- INSERT [dbo].[Items] ([ItemNo], [Name], [Price], [Quantity in Store]) VALUES (400, N'D', 6000, 400)
--
-- CREATE TABLE [dbo].[Customers](
-- 	[CustomerNo] [varchar](2) NOT NULL Primary Key,
-- 	[Name] [varchar](30) NULL,
-- 	[City] [varchar](3) NULL,
-- 	[Phone] [varchar](11) NULL
-- 	)
-- GO
-- INSERT [dbo].[Customers] ([CustomerNo], [Name], [City], [Phone]) VALUES (N'C1', N'AHMED ALI', N'LHR', N'111111')
-- INSERT [dbo].[Customers] ([CustomerNo], [Name], [City], [Phone]) VALUES (N'C2', N'ALI', N'LHR', N'222222')
-- INSERT [dbo].[Customers] ([CustomerNo], [Name], [City], [Phone]) VALUES (N'C3', N'AYESHA', N'LHR', N'333333')
-- INSERT [dbo].[Customers] ([CustomerNo], [Name], [City], [Phone]) VALUES (N'C4', N'BILAL', N'KHI', N'444444')
-- INSERT [dbo].[Customers] ([CustomerNo], [Name], [City], [Phone]) VALUES (N'C5', N'SADAF', N'KHI', N'555555')
-- INSERT [dbo].[Customers] ([CustomerNo], [Name], [City], [Phone]) VALUES (N'C6', N'FARAH', N'ISL', '666666')
-- go
--
-- CREATE TABLE [dbo].[Order](
-- 	[OrderNo] [int] NOT NULL Primary Key,
-- 	[CustomerNo] [varchar](2) NULL foreign key References Customers(CustomerNo),
-- 	[Date] [date] NULL,
-- 	[Total_Items_Ordered] [int] NULL
-- 	)
-- go
--
-- INSERT [dbo].[Order] ([OrderNo], [CustomerNo], [Date], [Total_Items_Ordered]) VALUES (1, N'C1', CAST(0x7F360B00 AS Date), 30)
-- INSERT [dbo].[Order] ([OrderNo], [CustomerNo], [Date], [Total_Items_Ordered]) VALUES (2, N'C3', CAST(0x2A3C0B00 AS Date), 5)
-- INSERT [dbo].[Order] ([OrderNo], [CustomerNo], [Date], [Total_Items_Ordered]) VALUES (3, N'C3', CAST(0x493C0B00 AS Date), 20)
-- INSERT [dbo].[Order] ([OrderNo], [CustomerNo], [Date], [Total_Items_Ordered]) VALUES (4, N'C4', CAST(0x4A3C0B00 AS Date), 15)
--
-- GO
-- CREATE TABLE [dbo].[OrderDetails](
-- 	[OrderNo] [int] NOT NULL foreign key References [Order](OrderNo),
-- 	[ItemNo] [int] NOT NULL foreign key References Items(ItemNo),
-- 	[Quantity] [int] NULL,
-- 	Primary Key (OrderNo, ItemNo)
-- 	)
-- GO
-- INSERT [dbo].[OrderDetails] ([OrderNo], [ItemNo], [Quantity]) VALUES (1, 200, 20)
-- INSERT [dbo].[OrderDetails] ([OrderNo], [ItemNo], [Quantity]) VALUES (1, 400, 10)
-- INSERT [dbo].[OrderDetails] ([OrderNo], [ItemNo], [Quantity]) VALUES (2, 200, 5)
-- INSERT [dbo].[OrderDetails] ([OrderNo], [ItemNo], [Quantity]) VALUES (3, 200, 20)
--
-- select * from Items
-- select * from Customers
-- select * from dbo.[Order]
-- select * from OrderDetails

-- Task 1 starts here

-- Create a View that gives order number and total price of that order (price= item price * item Quantity)
create view view_1 as
    select O.OrderNo as Order_Number, sum(I.Price*O.Quantity) as price
    from [dbo].[OrderDetails] as O join [dbo].[Items] as I on O.ItemNo=I.ItemNo
    group by O.OrderNo
go
select * from view_1 go

-- Create a View that gives all the items that are doing well in sales. The criteria to judge which item is doing good sale is that the item is has sold more than 20 pieces.
create view view_2 as
    select O.ItemNo,I.Name,I.Price
    from [dbo].OrderDetails O join [dbo].[Items] I on O.ItemNo=I.ItemNo
    group by O.ItemNo,I.Name,I.Price
    having sum(O.Quantity)>20
go
select * from view_2 go

-- Create a view that return StarCustomers. StarCustomers are the customers who have made a purchase of more than 2000.
create view StarCustomers as
    select C.CustomerNo,C.Name,C.City,C.Phone, V.price
    from view_1 V join [dbo].[Order] O on O.OrderNo=V.Order_Number
    join [dbo].Customers C on O.CustomerNo = C.CustomerNo
    where V.price>2000
go
select * from StarCustomers go

-- Create a view that returns all the customers that have phone number not null.
-- Create it without with check option.
-- Create the same view with WITH CHECK option.
-- a. Now try to insert, delete and update though the view, and observe the results.
create view view_41 as
    select *
    from [dbo].[Customers] as C
    where C.Phone is NULL
go
select * from view_41 go

create view view_42 as
    select *
    from [dbo].[Customers] as C
    where C.Phone is NULL
    with check option
go
select * from view_42 go

insert into view_41
values ('C7','SABOOR','LHR',777777)
go

insert into view_42
values ('C8','SABOOR','LHR',777777)
go
-- with check option throws an error that prevents any alteration of view