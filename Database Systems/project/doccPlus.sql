-- Queries for creating databases and relations

use master
drop database doccPlus
go

-- creating database
create database doccPlus
go

-- changing scope
use doccPlus

-- creating tables

use doccPlus
create table subscription(
    subID int not null primary key,
    tierName varchar(20) not null,
    description varchar(100) not null,
    cost float not null
)

use doccPlus
create table doctor(
    docID int not null primary key,
    firstName varchar(20) not null,
    lastName varchar(20) not null,
    CNIC int not null unique,
    phoneNum int not null,
    address varchar(100) not null,
    gender bit not null,
    specialization varchar(100) not null,
    education varchar(100) not null,
    Experience int not null,
    availability bit not null,
    numberOfCases int not null,
    subscription int foreign key references [subscription](subID),
    approvedStatus bit not null,
)

use doccPlus
create table patient(
    patientID int not null primary key,
    firstName varchar(20) not null,
    lastName varchar(20) not null,
    CNIC int not null unique,
    phoneNum int not null,
    DOB date not null,
    gender bit not null,
    subscription int not null foreign key references [subscription](subID),
    medicalHistory varchar(500) not null,
)

use doccPlus
create table caseHistory(
    caseID int not null primary key,
    docID int not null foreign key references [doctor](docID),
    patientID int not null foreign key references [patient](patientID),
    diagnosis varchar(500),
    date date not null,
    curedStatus bit not null,
    likedDoc bit not null,
    rating int not null,
    bpLow float not null,
    bpHigh float not null,
    sugarLevel float not null,
    prescription varchar(500) not null,
    dComments varchar(256),
    pComments varchar(256),
    meetingLink varchar(100) not null
)