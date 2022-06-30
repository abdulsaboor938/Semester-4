-- Abdul Saboor
-- 20L-1113
-- BDS-4A

-- Task 1 starts here

-- creating database

-- create database netflix
-- go

-- creating tables
use netflix
--
-- create table Users(
--     UserID int not null unique,
--     Name varchar(20) not null,
--     EmailAddress varchar(50) not null,
--     SignUpDate date not null
-- )
-- go
--
-- create table Category(
--     categoryID integer not null unique,
--     categoryName varchar(50) not null
-- )
-- go
--
-- create table Movies(
--     MovieId integer not null unique,
--     MovieTitle varchar(100) not null,
--     MovieCategoryID integer not null,
--     RentalRatePerDay float not null
-- )
-- go
--
-- create table Rentals(
--     rentalID integer unique not null,
--     userID integer not null,
--     movieID integer not null,
--     RentalStartDate date not null,
--     RentalEndDate date not null
-- )
-- go

-- inserting data to tables

-- insert into Users
-- values
-- (1,'bob','bob@gmail.com','1-1-2016'),
-- (2,'Tom','tom@yahoo.com','1-2-2017'),
-- (3,'Alice','alice@gmail.com','1-6-2014'),
-- (4,'Jim','Jim@ymail.com','1-6-2017')
-- go
--
-- insert into Category
-- values
-- (1,'Horror'),(2,'Comedy'),
-- (3,'Animated'),
-- (4,'Action')
-- go
--
-- Insert into Movies
-- values
-- (1,'MI-I',4,3.3),
-- (2,'MI-II',4,4.3),
-- (3,'MI-III',4,5),
-- (4,'horton hears a who',3,5.0),
-- (5,'sherk-2',3,5.0)
-- Insert into Movies
-- values
-- (6,'xyz',null,10) -- gives error
--
--
-- Insert into rentals values (1,1,1,'1-6-2019','1-10-2019')
-- Insert into rentals values (2,1,1,'2-7-2018','2-10-2018')
-- Insert into rentals values (3,1,2,'3-8-2018','2-13-2019')
-- Insert into rentals values (4,2,3,'4-9-2019','4-15-2019')
-- Insert into rentals values (5,3,1,'1-7-2018','1-30-2018')
-- Insert into rentals values (6,3,5,'2-8-2018','2-21-2018')
-- Insert into rentals values (7,3,6,'2-8-2019','2-21-2019')
-- go

-- primary key constraints

-- alter table Rentals add constraint PK_RENTAL primary key (rentalID)
-- alter table Movies add constraint PK_MOVIES primary key (MovieId)
-- alter table Users add constraint PK_USERS primary key (UserID)
-- alter table Category add constraint PK_CATEGORY primary key (categoryID)

-- foreign key constraints

-- alter table Rentals add constraint FK_REN foreign key(userID) references Users(UserID) on delete No Action on update no Action
-- alter table Rentals add constraint FK_RENTAL foreign key(movieID) references Movies(MovieId) on delete No Action on update no Action
-- alter table Movies add constraint FK_MOV foreign key(MovieCategoryID) references Category(categoryID) on delete No Action on update no Action

-- Task 2 starts here

select userID, UPPER(Name)
from Users

select MovieTitle,(RentalRatePerDay*7) as RentalPerWeek
from Movies

select movieID
from Rentals
where userID=3

select distinct userID
from Rentals

select *
from Users
where SignUpDate between '2017-01-01' and '2017-12-31'

select MovieTitle,RentalRatePerDay
from Movies
where RentalRatePerDay<5

Select UserID
From Users
Except
Select userID
From Rentals

select userID
from Rentals
where movieID between 1 and 3

Select categoryID
From Category
Except
Select MovieCategoryID
From Movies

select categoryID
from Category
where Category.categoryName like '%c%'

select *
from Users
where EmailAddress like '%gmail%'

select isnull(MovieCategoryID,0),MovieTitle
from Movies

select datediff(day,RentalStartDate,RentalEndDate) as RentalDays
from Rentals
where userID=1 and movieID=2