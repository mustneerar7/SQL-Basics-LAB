select * from Orders o
where o.EmployeeID=5 or EmployeeID=7

-- FWGHSO
-- FROM WHERE GROUPBY HAVING ORDERBY SELECT ORDERBY

-- employee id must be 3,4,5
select * from Orders o
where o.EmployeeID in (3,4,5)

-- specify a range between
select * from Orders o
where o.EmployeeID between 5 and 20

--like

-- starting with S and having characters
select * from Orders o
where o.CustomerID like 'S____'

-- starting from A
select * from Orders o
where o.CustomerID like 'A%'

-- starting from A ending at S
select * from Orders o
where o.CustomerID like 'A%S'

-- either starting with A or B
select * from Orders o
where o.CustomerID like '[AB]%'

--joins
select * from Orders
select top 1 o.EmployeeID,count(o.OrderID) as total from Orders o
group by EmployeeID 
order by total desc