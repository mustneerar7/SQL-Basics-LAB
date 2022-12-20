use Northwind

--Functions
-- scalar
-- inline
-- multiline

create function fun_scalar(@c_name varchar(50))
returns int

as
begin

declare @total int

	set @total=(select sum(o.Freight) as total 
	from Orders o
	inner join Customers c
	on o.CustomerID=c.CustomerID
	where c.CustomerID=@c_name)

return @total
end

select dbo.fun_scalar('ALFKI')

