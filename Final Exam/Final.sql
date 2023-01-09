/***********************************
	DATABASE I LAB EXAM TERMINAL
	----------------------------
	SP21-BCS-105
	Mustneer Ahmad Rana
***********************************/

use Northwind

/* Before inserting, check the detail about the product name. 
If the product name is available, update an existing 
product qty + inserted product qty.*/

/* If above condition not satisfied, insert the product information, 
as new record into the table.*/

create procedure check_details
@product_name varchar(50),
@product_quantity int

as 
if exists (Select '#' from Products where ProductName = @product_name)
begin
	update Products
	set UnitsInStock = UnitsInStock + @product_quantity
	where ProductName = @product_name
end
else
begin 
	insert into Products 
	(ProductName, UnitsInStock)
	values(@product_name, @product_quantity)

end

/* Create a Trigger, which is used to perform the requirement, given below:
If a customer buys particular product, your stock must be updated according to the order
of the customer. And if the quantity of the order product is larger than the stock quantity,
your system should print a message I offered --- number of products. If customer agree
then order proceed, otherwise rollback the transaction. */

create trigger stock_check
on [Order Details]
for insert
as
begin
	declare @prod_id int
	declare @prod_quantity int
	declare @stock_quantity int

	declare @flag int
	set @flag = 0

	select @prod_id = ProductId from inserted
	select @prod_quantity = Quantity from inserted

	set @stock_quantity = (select UnitsInStock from Products where ProductID = @prod_id)

	if(@stock_quantity < @prod_quantity)
	begin
		print 'System offers ' + cast(@stock_quantity as varchar) + ' products'
	end

	if(@stock_quantity = 0)
	begin
		print 'The product is out of stock'
	end

	else
	begin
		update Products
		set UnitsInStock = UnitsInStock - @prod_quantity
		where ProductID = @prod_id
	end
end