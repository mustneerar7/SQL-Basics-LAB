use lab3_db

create table tbl_employee(
	Id int primary key,
	[name] varchar(100),
	gender varchar(2),
	CITY VARCHAR(20),
	salary int,
)
insert into tbl_employee values(1, 'Ali', 'M', 'LHR', 4000),
								(2, 'Bilal', 'M', 'LHR', 4000),
								(3, 'Ahmad', 'M', 'ISL', 4000),
								(4, 'Zainab', 'F', 'ISL', 4000),
								(5, 'Amna', 'M', 'GRW', 4000)

select * from tbl_employee

-- aggregate functions
-- can use an alias
-- doesnt effect backend
select count (*) as total_rows from tbl_employee
select avg(salary) as avg_salary from tbl_employee
select min(salary) as minimum_salary from tbl_employee
select max(salary) as minimum_salary from tbl_employee

-- group by
select city,sum(salary) as total_salary from tbl_employee
group by city

select city,gender,sum(salary) as total_salary from tbl_employee
group by city,gender

select gender,sum(salary) as total_salary from tbl_employee
group by gender

