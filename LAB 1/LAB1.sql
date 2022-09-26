create database sample_db

use sample_db

-- creating a table
create table tbl_student(
	id int not null,
	[name] varchar(20) null,
)

-- displaying all values of table
select * from tbl_student

-- insert an entry to table
insert into tbl_student values(1, 'Mustneer')

insert into tbl_student (name)values('Ali')
insert into tbl_student (id)values(5)

select [name] from tbl_student

-- renaming existing database
sp_renamedb 'sample_db', 'new_db'
-- renaming existing table
sp_rename 'tbl_student', 'students'

select * from students

-- adding a new column to exisitng table
alter table students
add cgpa float

-- removing a column from existing table
alter table students
drop column cgpa

-- deleting an entry from table
delete from students where id=5

-- emoty the entrire table
truncate table students

-- delete table
drop table students 

create table tbl_stu(
	id int primary key,
	names varchar(10)
)

insert into tbl_stu values(12, 'abc')

select * from tbl_stu

-- adding a unique key to existing table
alter table tbl_stu
add constraint uq_names
unique(names)