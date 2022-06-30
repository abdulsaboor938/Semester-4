-- This is the DDL part of Database definition
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------

create database test -- to create a database on the server

use test -- to use a database instance

drop database test -- to drop a database on server

create table table1(
    column1 int primary key default 0 identity(1,1),
    column2 varchar(50) not null unique,
    column3 int check(column3>3 and column3<7),
    column4 varchar(50),-- foreign key references table2(column2) on delete no action on update cascade,
    primary key(column1), -- this is a composite primary key
    check(column3>3 and column3<8) -- there is no comma after last statement
)

drop table table1 -- to drop a table from database
truncate table table1 -- this deletes all the rows from a given table

-- altering table's columns
alter table Student add cgpa float NOT NULL -- using alter table command to add a column
alter table Student drop column cnic -- using alter table command to drop a column
alter table  Student alter column rollNumber varchar(100) NOT NULL -- using alter table command to modify a column

---------------------------------------------------------------------------------------------------------------
-- Now that a databse and table is created, its time to add all the constraints
-- Add NOT NULL Constraint Using Create Table:
Create Table Student
(
    rollNumber int NOT NULL,
    name nvarchar(50) NOT NULL,
    cgpa float NULL
)
-- Add NOT NULL Constraint Using ALTER Table:
Alter Table Student Alter column rollNumber int NOT NULL
---------------------------------------------------------------------------------------------------------------
-- Add Unique Constraint Using Create Table
Create Table Student
(
    rollNumber int NOT NULL,
    name nvarchar(50) NOT NULL,
    cnic nvarchar(50) NOT NULL unique,
    cgpa float NULL
)
-- Unique constraint can also be defined as follows:
Create Table Student
(
    rollNumber int NOT NULL,
    name nvarchar(50) NOT NULL,
    cnic nvarchar(50) NOT NULL,
    cgpa float NULL
    unique (cnic)
)
-- Add Unique Constraint Using Alter Table
Alter Table Student add constraint UNIQUE_CONSTRAINT_STUDENT_CNIC Unique (cnic)
-- Unique Constraint on a Combination of Columns
-- Unique constraint can also be applied on a combination of columns:
Create Table Student
(
    rollNumber int NOT NULL,
    name nvarchar(50) NOT NULL,
    cnic nvarchar(50) NOT NULL,
    cgpa float NULL,
    unique (cnic, name)
)
-- (OR)
Alter Table Student add constraint UNIQUE_CONSTRAINT_STD_CNIC_NAME Unique (cnic, name)
---------------------------------------------------------------------------------------------------------------
-- Add Primary Key Constraint Using Create Table
Create Table Student
(
    rollNumber int primary key,
    name nvarchar(50) NOT NULL,
    cnic nvarchar(50) NOT NULL,
    cgpa float NULL
)
-- (OR)
Create Table Student
(
    rollNumber int,
    name nvarchar(50) NOT NULL,
    cnic nvarchar(50) NOT NULL,
    cgpa float NULL
    primary key (rollNumber)
)
-- Add Primary Key Constraint Using Alter Table
-- To add primary key using alter table statement, the column must have not null constraint, otherwise the not null constraint must first be defined.
Alter Table Student alter column rollNumber int NOT NULL
Alter Table Student add constraint PK_STUDENT primary key (rollNumber)
-- Composite Primary Key
-- A primary key involving more than one column is called composite primary key. 
-- Add composite Primary Key Using Alter Table
Create Table Student
(
    rollNumber int,
    name nvarchar(50),
    cnic nvarchar(50),
    cgpa float,

    primary key (rollNumber, cnic)
)
-- Add Composite Primary Key Using Alter Table
Alter Table Student add constraint PK_STUDENT primary key (rollNumber, cnic)
---------------------------------------------------------------------------------------------------------------
-- Add Foreign Key Constraint Using Create Table

CREATE TABLE Student (
    rollNumber int PRIMARY KEY,
    deptId int FOREIGN KEY REFERENCES Department(departmentId)
);
-- (OR)
CREATE TABLE Student(
    rollNumber int,
    deptId int,
    PRIMARY KEY (rollNumber),
    FOREIGN KEY (deptId) REFERENCES Department(departmentId)
);
-- Add Foreign Key Constraint Using Alter Table: 
Alter Table Student add constraint FK_STUDENT foreign key (deptId) references Department (departmentId)

-- Cascade/No Action/Set NULL:
-- We can define some actions for a foreign key value whenever there is a change (update or delete) in the primary key value.
-- If we want to update the foreign key value when the corresponding primary key value is updated, and delete the foreign key value whenever the corresponding primary key value is deleted; we use cascade option.
-- If we want to set the foreign key value to null whenever the corresponding primary key value is updated or deleted, then we use set NULL option.
-- If we want to force the foreign key to remain unchanged, we will use No Action option. If No Action is specified, then the primary key value will not be allowed to delete or update in the referenced table if there is a corresponding value of foreign key in the referencing table.
-- Example:
Create Table Student
(
    rollNumber int primary key,
    deptId int,
    name nvarchar(50) NOT NULL,
    cnic nvarchar(50) NOT NULL,
)
Create Table Department
(
	departmentId int primary key,
	departmentName nvarchar(50)
)
alter table Student add constraint FK_STUDENT foreign key (deptId) references Department (departmentId) on delete No Action on update Cascade
-- Composite Foreign key:
-- A primary key which is composite in the referenced table will form a composite foreign key in the referencing table (all attributes of the composite primary key must be part of the foreign key in such a case).
---------------------------------------------------------------------------------------------------------------
-- Add Check Constraint Using Create Table
Create Table Student
(
    rollNumber int,
    name nvarchar(50) NOT NULL,
    cnic nvarchar(50) NOT NULL,
    cgpa float NULL check (cgpa>=0 AND cgpa<=4),
)
-- (OR)
Create Table Student
(
    rollNumber int,
    name nvarchar(50) NOT NULL,
    cnic nvarchar(50) NOT NULL,
    cgpa float NULL,
    check (cgpa>=0 AND cgpa<=4) 
)
-- Add Check Constraint Using Alter Table
alter table Student add Constraint STUDENT_CHECK_CGPA check (cgpa>=0 AND cgpa<=4)
-- Check Constraint can be applied to relate the value of a column with another column:
Create Table StudentMarks
(
    rollNumber int,
    obtainedMarks float, 
    maximumMarks float, 
    check (obtainedMarks >=0 AND obtainedMarks<= maximumMarks)
)
---------------------------------------------------------------------------------------------------------------
-- Add Default Constraint Using Create Table
Create Table Student
(
    rollNumber int,
    name nvarchar(50) NOT NULL,
    cnic nvarchar(50) NOT NULL,
    cgpa float default 0,
    check (cgpa>=0 AND cgpa<=4) 
)
-- Add Default Constraint Using Create Table
alter table Student add constraint DEFAULT_SUDENT_CGPA default 0 for CGPA
---------------------------------------------------------------------------------------------------------------
alter table Student drop constraint DEFAULT_SUDENT_CGPA -- this is drop constraint defined on a table