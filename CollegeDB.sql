if exists (Select DB_ID('College'))
	begin
		drop database College;
		create database College;
	end;
go

use College
go

create table Students
(StudentID int not null IDENTITY PRIMARY KEY,
FName varchar(30) not null,
LName varchar(30) not null,
SSN int not null,
[Address] varchar(75) not null,
City varchar(30) not null,
[State] varchar(2) not null,
Zip int not null,
Phone bigint null);
go

create table Classes
(ClassID int not null IDENTITY PRIMARY KEY,
TitleID int not null,
Number varchar(3),
DeptID int not null);
go

create table Scores
(ScoreID int not null IDENTITY PRIMARY KEY,
ScoreTypeID int null,
DateAssigned date null,
DateDue date null,
DateSubmitted date null,
PointsEarned int null,
PointsPossible int null);
go

create table Main
(MainID int not null IDENTITY PRIMARY KEY,
FK_Students_StudentID int not null REFERENCES dbo.Students(StudentID),
FK_Classes_ClassID int not null REFERENCES dbo.Classes(ClassID),
FK_Scores_ScoreID int not null REFERENCES dbo.Scores(ScoreID));
go

create table Titles
(TitleID int not null IDENTITY PRIMARY KEY,
TitleDescr varchar(30) not null);
go

create table Departments
(DeptID int not null IDENTITY PRIMARY KEY,
DeptDescr varchar(30) not null);
go

create table ScoreTypes
(ScoreTypeID int not null IDENTITY PRIMARY KEY,
ScoreTypeDescr varchar(30) not null);
go

delete from Students;
delete from Classes;
delete from Scores;
go

insert Students (FName, LName, SSN, [Address], City, [State], Zip, Phone)
values ('John', 'Smith', 111223333, '123 Main St.', 'Anytown', 'CA', 93210, 9032198752),
		('Jane', 'Doe', 222334444, '03687 Bear Rd.', 'Rural', 'OK', 62184, 5347403021),
		('Jack', 'Johnson', 333445555, '5530 West Av.', 'Big City', 'NY', 01598, 1209334218);
go

insert Classes (TitleID, Number, DeptID)
values(1, 101, 1),
	(2, 102, 2),
	(3, 201, 3);
go

insert Scores (ScoreTypeID, DateAssigned, DateDue, DateSubmitted, PointsEarned, PointsPossible)
values(1, '2019-01-01', '2019-01-07', '2019-01-07', 9, 10),
(2, '2019-01-10', '2019-01-10', '2019-01-10', 6, 10),
(3, '2019-01-25', '2019-01-25', '2019-01-25', 28, 50),
(1, '2019-01-07', '2019-01-14', '2019-01-14', 10, 10),
(2, '2019-01-17', '2019-01-17', '2019-01-17', 9, 10),
(3, '2019-01-27', '2019-01-27', '2019-01-27', 28, 50),
(1, '2019-01-14', '2019-01-21', '2019-01-21', 9, 10),
(2, '2019-01-24', '2019-01-24', '2019-01-24', 7, 10),
(3, '2019-01-28', '2019-01-28', '2019-01-28', 29, 50),
(1, '2019-01-01', '2019-01-07', '2019-01-07', 8, 10),
(2, '2019-01-10', '2019-01-10', '2019-01-10', 5, 10),
(3, '2019-01-25', '2019-01-25', '2019-01-25', 37, 50),
(1, '2019-01-07', '2019-01-14', '2019-01-14', 5, 10),
(2, '2019-01-17', '2019-01-17', '2019-01-17', 10, 10),
(3, '2019-01-27', '2019-01-27', '2019-01-27', 37, 50),
(1, '2019-01-14', '2019-01-21', '2019-01-21', 5, 10),
(2, '2019-01-24', '2019-01-24', '2019-01-24', 10, 10),
(3, '2019-01-28', '2019-01-28', '2019-01-28', 39, 50),
(1, '2019-01-01', '2019-01-07', '2019-01-07', 9, 10),
(2, '2019-01-10', '2019-01-10', '2019-01-10', 5, 10),
(3, '2019-01-25', '2019-01-25', '2019-01-25', 28, 50),
(1, '2019-01-07', '2019-01-14', '2019-01-14', 8, 10),
(2, '2019-01-17', '2019-01-17', '2019-01-17', 6, 10),
(3, '2019-01-27', '2019-01-27', '2019-01-27', 36, 50),
(1, '2019-01-14', '2019-01-21', '2019-01-21', 7, 10),
(2, '2019-01-24', '2019-01-24', '2019-01-24', 7, 10),
(3, '2019-01-28', '2019-01-28', '2019-01-28', 35, 50);
go

insert Main (FK_Students_StudentID, FK_Classes_ClassID, FK_Scores_ScoreID)
values(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(1, 2, 4),
(1, 2, 5),
(1, 2, 6),
(1, 3, 7),
(1, 3, 8),
(1, 3, 9),
(2, 1, 10),
(2, 1, 11),
(2, 1, 12),
(2, 2, 13),
(2, 2, 14),
(2, 2, 15),
(2, 3, 16),
(2, 3, 17),
(2, 3, 18),
(3, 1, 19),
(3, 1, 20),
(3, 1, 21),
(3, 2, 22),
(3, 2, 23),
(3, 2, 24),
(3, 3, 25),
(3, 3, 26),
(3, 3, 27);
go

insert Titles
values ('Algebra'),
		('Biology'),
		('Marketing');
go

insert Departments
values ('Math'),
		('Science'),
		('Business');
go

insert ScoreTypes
values ('Homework'), 
		('Quiz'),
		('Exam');
go

select StudentID, FName, LName, SSN, [Address], City, [State], Zip, Phone, 
ClassID, Classes.TitleID, TitleDescr, Number, Classes.DeptID, DeptDescr, ScoreID, Scores.ScoreTypeID, 
ScoreTypeDescr, DateAssigned, DateDue,
DateSubmitted, PointsEarned, PointsPossible
from Main
inner join Students on FK_Students_StudentID = StudentID
inner join Classes on FK_Classes_ClassID = ClassID
inner join Titles on Classes.TitleID = Titles.TitleID
inner join Departments on Classes.DeptID = Departments.DeptID
inner join Scores on FK_Scores_ScoreID = Scores.ScoreID
inner join ScoreTypes on Scores.ScoreTypeID = ScoreTypes.ScoreTypeID;

