create database lab2_db

use lab2_db

-- created a table with a primary key
create table tbl_customer(
	Id int primary key,
	c_name varchar(100),
)
-- created a table with a foreign key
-- pointing towards the primary key
-- of tbl_customer
create table tbl_order(
	o_id int not null,
	o_name varchar(100),

	o_order int,
	foreign key(o_order) references tbl_customer(Id)
)

-- if you have to add foreign key 
-- to already existing table
alter table tbl_order
add constraint Fk_custId
Foreign Key(o_order) references tbl_customer(Id)

-- inserting some values
insert into tbl_customer values(1, 'Ali')

-- primary key of first table
-- must be entered as foreign key of second
insert into tbl_order values(100, 'Cake', 1)

-- for displaying tables
select * from tbl_customer
select * from tbl_order


create table tbl_student(
	s_id int primary key,
	s_name varchar(100),
)
create table tbl_course(
	c_id int primary key,
	c_name varchar(100),
)

-- creating a child table using foreign keys
create table tbl_stack(
	student_id int,
	foreign key(student_id) references tbl_student(s_id),

	course_id int,
	foreign key(course_id) references tbl_course(c_id)
)

-- inserting some values
insert into tbl_student values(1, 'Ali')
insert into tbl_course values(232, 'Database I')

-- for displaying tables
select * from tbl_stack

select * from tbl_course
select * from tbl_student

-- CASCADING
-- deleting parent value 
-- would also remove child values
delete from tbl_customer where id=1

select * from tbl_order