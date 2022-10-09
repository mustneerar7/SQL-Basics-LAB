create database lab3_db
use lab3_db

-- adding identity to a column
create table tbl_identity(
	Id int primary key Identity(2, 5),
	[name] varchar(100),
	age int
)
-- should insert Id = 2
insert into tbl_identity values('Ali', 21)
-- should insert Id = 7 (ie 2+5)
insert into tbl_identity values('Ahmed', 21)

select * from tbl_identity

-- add a custom value to identity column
set identity_insert tbl_identity on
-- columns must be specified
insert into tbl_identity(Id,[name], age) values(1,'Arif', 22)

-- to get back to original state
set identity_insert tbl_identity off
insert into tbl_identity values('Babar', 21)

-- add custom info in nullable column
alter table tbl_identity
add constraint df_names
default 'unknown name' for [name]

-- add data to table
-- (since identity is on and default value is set for [name])
insert into tbl_identity(age)values(13)

-- add a check constraint on column
alter table tbl_identity
add constraint check_age
check (age>0 and age <22)

-- remove a checked constraint
alter table tbl_identity
drop constraint check_age