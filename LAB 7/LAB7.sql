use Northwind

--largest ammount order
select CompanyName from Customers where CustomerID = 
(select CustomerID from Orders where OrderID = 
(select top 1 OrderID from [Order Details]
order by UnitPrice * Quantity DESC))

-- retreving a table of filtered records
-- from multiple tables
select * from(
SELECT top 1 od.orderID, 
sum(UnitPrice*Quantity) as Totl_amnt FROM [Order Details]od
group by od.OrderID
order by Totl_amnt desc)temp

inner join Orders o
on o.OrderID = temp.OrderID

inner join Customers c
on c.CustomerID = o.CustomerID

-- indexes
-- a table can only have one clustered index
-- but multiple non-clustered index
select * from Orders
where CustomerID = 'TOMSP'

-- lab exam will be from sub quries
-- exam will be from pubs database 