use Northwind

-- STORE PROCEDURES
-- basically functions in SQL

-- declaration
create procedure SP_name_0

-- variable name
@cust_name varchar(20)

as
begin
	-- logic
	select * from Customers
	where ContactName=@cust_name
end

-- calling a procedure
execute SP_name_0 'Maria Anders'
