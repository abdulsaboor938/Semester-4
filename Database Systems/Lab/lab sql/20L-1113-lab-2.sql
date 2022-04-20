-- Abdul Saboor
-- 20L-1113
-- BDS 4A1

-- creating database

-- create database Lab02
-- go

-- using database
-- use Lab02;
--create table Student(
--	RollNum char(7) NOT NULL unique,
--	Name char(20) NOT NULL,
--	Gender char(6) NOT NULL,
--	Phone char(12) NOT NULL
--);

--create table Attendance(
--	RollNum char(7) NOT NULL unique,
--	Date DATE NOT NULL,
--	Status char(1) NOT NULL,
--	ClassVenue INT NOT NULL
--);

-- create table ClassVenue(
-- 	ID INT NOT NULL unique,
-- 	Building char(10) NOT NULL,
--  RoomNum int,
--  TeacherId int
-- );

--create table Teacher(
--	ID INT NOT NULL unique,
--	Name char(20) NOT NULL,
--	Designation char(20) NOT NULL,
--	Department char(20) NOT NULL
--);

-- insert into Student([RollNum], [Name], [Gender], [Phone])
-- values
-- ('L164123','Ali Ahmad','Male','0333-3333333'),
-- ('L164124','Rafia Ahmed','Female','0333-3456789'),
-- ('L164125','Basit Junaid','Male','0333-3333333')
-- go

-- insert into Attendance ([RollNum], [Date], [Status], [ClassVenue])
-- values
-- ('L164123', '2016-2-22', 'P', 2),
-- ('L164124', '2016-2-23', 'A', 1),
-- ('L164125', '2016-4-3', 'P', 2)
-- go

-- insert into ClassVenue([ID],[Building],[RoomNum],[TeacherId])
-- values
-- (1,'CS',2,1),
-- (2,'Civil',7,2)
-- go

-- insert into Teacher([Id],[Name],[Designation],[Department])
-- values
-- (1,'Saima Baig', 'Assistant Prof.', 'Computer Science'),
-- (2,'Bismillah Jan', 'Lecturer', 'Civil Eng.'),
-- (3,'Kashif zafar', 'Professor', 'Electrical Eng.')
-- go

-- question 2 starts here

-- alter table Student add constraint PK_STUDENT primary key (RollNum)
-- alter table Attendance add constraint PK_ATTENDANCE primary key (RollNum)
-- alter table ClassVenue add constraint PK_ID primary key (ID)
-- alter table Teacher add constraint PK_Id primary key (Id)

-- question 3 starts here

-- use Lab02;
-- alter table Attendance add constraint FK_Att foreign key(RollNum) references Student(RollNum) on delete No Action on update no Action
-- alter table Attendance add constraint FK_Attendance foreign key(ClassVenue) references ClassVenue(ID) on delete No Action on update Cascade
-- alter table ClassVenue add constraint FK_ClassVenue foreign key(TeacherId) references Teacher(Id) on delete No Action on update Cascade

-- question 4 starts here
--
-- alter table Student
-- add warning_count int

-- question 5 starts here
insert into Student
values
('L162334','Fozan Shahid','Male',3.2)
-- not valid as phone number not in correct format and warning count not given
go

insert into ClassVenue
values
(3,'CS',5,'Ali') -- not valid as teacher id should be integer
go

update Teacher
set Name='Dr. Kashif Zafar'
where Name='kashif Zafar'
-- valid as we are updating name only
go

use Lab02;
--delete from Student where RollNum='L162334' -- valid query but no deletion
delete from Student where RollNum='L164123' -- valid query but no deletion
delete from Attendance where RollNum='L164124' AND Status='A'-- valid query but no deletion as status is present
go

-- question 6 starts here
use Lab02
alter table Student
add CNIC int
go

use Lab02
alter table Student
drop column Phone
go

use Lab02
Alter Table Teacher alter column Name char(20) not null
go

alter table Student add CONSTRAINT chk_Frequency CHECK (Gender IN ('Male','Female'))
alter table Attendance add CONSTRAINT chk_Freq CHECK (Status IN ('A','P'))