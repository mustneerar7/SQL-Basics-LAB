use Northwind

-- SUB QUERIES
where salary > (select salary from tbl
where name='john')

-- outer query 'operator' (inner query)
-- always write outer query first
-- never use multiple columns in inner query
-- single row operators
--  >=, = , <= <, > 
-- multi-row operatiors
-- IN OR AND

-- write a query to get product list 
-- where current product cost less than $2.
select productID, ProductName, UnitPrice from Products 
where UnitPrice < 20

-- write a query to get products list to get
-- ten most expensive products.
select top 10 * from Products order by UnitPrice  DESC

-- NESTED SUB QURIES
select * from Orders
select * from Customers
select * from Employees

-- Find the company which 
-- purhcased most expensive product
select CompanyName from Customers where CustomerID in
(select CustomerID from Orders where OrderID in 
(select OrderID from [Order Details] where ProductID =
(select ProductID from Products where ProductName =
(select top 1 ProductName from products order by UnitPrice desc))))

-- Find the first name and last name of
-- eployee which sold the most expensive product
select LastName, FirstName from Employees where EmployeeID in
(select EmployeeID from Orders where OrderID in
(select OrderID from [Order Details] where ProductID =
(select ProductID from Products where ProductName =
(select top 1 ProductName from products order by UnitPrice desc))))

-- creating a temporary table
select * from
(select od.OrderID, od.quantity, od.ProductID from [Order Details] od
where ProductID = 
(select top 1 ProductID from Products
order by UnitPrice desc) and od.Quantity > 20)tbl

-- applying subquries on temporary table
select * from (
select (select o.CustomerID from Orders o where o.OrderID=t.OrderID)as customerinfo,
(select o.OrderDate from Orders o where o.OrderID=t.OrderID) as orddate,
t.Quantity from
(
select od.orderid,od.Quantity, od.ProductID from [order details] od
where productid=
(select top 1 productid 
from products
order by unitprice desc)  and od.Quantity>20) t)nextbox