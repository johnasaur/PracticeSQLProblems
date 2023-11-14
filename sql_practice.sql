/*Introductory problems
Question 1: Which shippers do we have?*/
Select *
From Shippers;

--Question 2: Certain fields from Categories?
Select CategoryName, Description
From Categories;

--Question 3: Sales representatives
Select Firstname, Lastname, HireDate
From Employees
Where Title = 'Sales Representative';

--Question 4: Sales Representatives in United States
Select FirstName, LastName, HireDate
From Employees
Where Title = 'Sales Representative' and Country = 'USA';

--Question 5: Orders placed by specific EmployeeID
Select OrderId, OrderDate 
From Orders
Where EmployeeId = 5;

--Question 6: Suppliers and ContactTitles
Select SupplierId, ContactName, ContactTitle
From Suppliers
Where ContactTitle != 'Marketing Manager';

--Question 7: Products with "queso" in productname
Select ProductId, ProductName
From Products
Where ProductName like '%queso%';

--Question 8: Orders shipping to France or Belgium
select OrderId, CustomerId, ShipCountry
From Orders
Where ShipCountry = 'France' or ShipCountry = 'Belgium';

--Question 9: Orders shipping to any country in Latin America
Select OrderId, CustomerId, ShipCountry
From Orders
Where ShipCountry in ('Brazil', 'Mexico', 'Argentina', 'Venezuela');

--Question 10: Employees, in order of age (oldest employees first)
Select FirstName, LastName, Title, BirthDate
From Employees
Order by BirthDate asc;

--Question 11: Slowly only the date with a datetime field
Select FirstName, LastName, Title, Convert(BirthDate, Date)
From Employees
Order by BirthDate asc;

--Question 12: Employees full name
Select FirstName, LastName, Concat(FirstName, ' ', LastName)
From Employees;

--Question 13: OrderDetails amount per line item
Select OrderId, ProductId, UnitPrice, Quantity, (UnitPrice * Quantity) as TotalPrice
From OrderDetails;

--Question 14: How many customers?
Select Count(CustomerId) as TotalCustomers
From Customers;

--Question 15: When was the first order?
Select Min(OrderDate) as FirstOrder
From Orders;

--Question 16: Countries where there are customers
Select Country
From Customers
Group by Country;

--Question 17: Contact titles for customers
Select ContactTitle, Count(ContactTitle) as TotalContactTitle
From Customers
Group by ContactTitle
Order by Count(ContactTitle) desc;

--Question 18: Products with associated supplier names
Select ProductId, ProductName, CompanyName as Supplier
From Suppliers s
Join Products p
On s.SupplierId = p.SupplierId;

--Question 19: Orders and the shipper that was used
Select OrderId, OrderDate, s.CompanyName as Shipper
From Orders o
Join Shippers s
On s.ShipperId = o.ShipVia
Where OrderId < 10270;







































--Question 31: Customers with no orders for EmployeeID 4
select c.customerid, o.customerid as 'customerorder'
from customers c
left join orders o 
on c.customerid = o.customerid and o.employeeid = 4
where o.customerid is NULL 
order by c.customerid




