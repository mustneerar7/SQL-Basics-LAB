create database lab4_db
use lab4_db

-- JOINS
-- helps to retreve data from multiple tables
-- with one query. Offers better retreaval times
-- applicable on specific senarios

-- creates sample data
Create table tblDepartment
(
     ID int primary key,
     DepartmentName nvarchar(50),
     Location nvarchar(50),
     DepartmentHead nvarchar(50)
)
Go

Insert into tblDepartment values (1, 'IT', 'London', 'Rick')
Insert into tblDepartment values (2, 'Payroll', 'Delhi', 'Ron')
Insert into tblDepartment values (3, 'HR', 'New York', 'Christie')
Insert into tblDepartment values (4, 'Other Department', 'Sydney', 'Cindrella')
Go

Create table tblEmployee
(
     ID int primary key,
     Name nvarchar(50),
     Gender nvarchar(50),
     Salary int,
     DepartmentId int foreign key references tblDepartment(Id)
)
Go

Insert into tblEmployee values (1, 'Tom', 'Male', 4000, 1)
Insert into tblEmployee values (2, 'Pam', 'Female', 3000, 3)
Insert into tblEmployee values (3, 'John', 'Male', 3500, 1)
Insert into tblEmployee values (4, 'Sam', 'Male', 4500, 2)
Insert into tblEmployee values (5, 'Todd', 'Male', 2800, 2)
Insert into tblEmployee values (6, 'Ben', 'Male', 7000, 1)
Insert into tblEmployee values (7, 'Sara', 'Female', 4800, 3)
Insert into tblEmployee values (8, 'Valarie', 'Female', 5500, 1)
Insert into tblEmployee values (9, 'James', 'Male', 6500, NULL)
Insert into tblEmployee values (10, 'Russell', 'Male', 8800, NULL)
Go

select * from tblEmployee
select * from tblDepartment

-- INNER JOIN
-- first table is the left table
select * from tblEmployee e
inner join tblDepartment d
on e.DepartmentId=d.ID

-- OUTER JOINS

-- (1).LEFT OUTER JOIN
-- takes common data 
-- and uncommon data of left table
select * from tblDepartment d
left outer join tblEmployee e
on e.DepartmentId=d.ID

-- (2).RIGHT OUTER JOIN
-- takes common data 
-- and uncommon data of right table
select * from tblDepartment d
right outer join tblEmployee e
on e.DepartmentId=d.ID

-- (3).FULL OUTER JOIN
-- takes common data 
-- and uncommon data of right table
select * from tblDepartment d
full outer join tblEmployee e
on e.DepartmentId=d.ID

-- CROSS JOIN
-- takes cartisian product
select * from tblDepartment d
cross join tblEmployee e

select * from tblEmployee
select * from tblDepartment

-- queries using joins
select * from tblDepartment d
full outer join tblEmployee e
on e.DepartmentId=d.ID
where e.DepartmentId is null or d.ID is null

select * from tblDepartment d
left outer join tblEmployee e
on e.DepartmentId=d.ID
where e.DepartmentId is null or d.ID is null

select * from tblDepartment d
right outer join tblEmployee e
on e.DepartmentId=d.ID
where e.DepartmentId is null or d.ID is null

-- similar results using SELECT and WHERE
select * from tblEmployee e, tblDepartment d
where e.DepartmentId = d.id

select id from tblEmployee e, tblDepartment d
where e.DepartmentId = d.id