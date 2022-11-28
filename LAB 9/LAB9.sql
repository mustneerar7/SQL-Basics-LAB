use Northwind

-- INDEXES
-- beinfits efficiency for searching

-- applying indexes
create index ix_customer 
on customers([Address])

-- applying clustered indexes
create clustered index ix_country 
on customers(Country)

-- dropping index
alter table customers
drop PK_customers

-- store procedure 
-- for displaying all indexes
select * from sys.indexes

-- VIEWS
-- virtual table
-- provides column level security
-- diesnt have complete rights

-- creating views

-- view 1
create view view_for_CEO 
as select * from Employees

-- view 2
create view view_for_managers
as select e.EmployeeID, 
e.FirstName, e.Country 
from Employees e

-- using created views
select * from view_for_CEO
select * from view_for_managers

-- inserting into view
insert into view_for_managers
(FirstName, Country)values('Ali', 'Pakistan')

-- MATERIALIZED VIEW
-- apply index on a view
-- to turn into materialized view
-- reserves separate memory for saving data
-- doesn't rely on parent table

-- (1). adding schema binding to view
alter view view_for_managers
with schemabinding
as
select e.EmployeeID, e.FirstName, 
e.Country from dbo.Employees e

-- (2). apply unique constraint
alter table Employees
add constraint uq_const
unique(EmployeeID)

-- (3). apply a clustered index
create unique clustered index ix_view_index
on view_for_managers(EmployeeID)