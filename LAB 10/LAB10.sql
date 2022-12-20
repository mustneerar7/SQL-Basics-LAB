use Northwind

--TRIGGERS

-- LOG ON Triggers

-- 1: DML Triggers
-- After Trigger
-- Instead of Trigger

create trigger trigger_name
on Customers
for insert
as
begin
	select * from Customers
end


create trigger trigger_2
on [orders]
for insert
as
begin
	declare @qty int
	exec get_qty

	update Products 
	set UnitsInStock = UnitsInStock - @qty
end

create procedure get_qty
@qty int output,
@odid int

as
begin
	select * from Orders o
	where o.OrderID =@odid
end

create database d2
use d2

create table table1(
	id int Primary Key,
	[name] varchar(50)
)

insert into table2
values(2, 'Karachi')

create table table2(
	c_id int Primary KEy,
	adress varchar(50),
)

create view my_view AS
select adress, [name]
from table1, table2

select * from my_view


create trigger tr_stup
on my_view 
instead of insert

as 
begin 

truncate table table2
end

insert into my_view
values(3, 'Islamabad')

select * from table2
