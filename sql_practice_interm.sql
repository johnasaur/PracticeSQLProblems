/*Intermediate Problems
Question 20: Categories, and the total products in each category*/
Select CategoryName, Count(ProductId) as TotalProducts
From Categories c
Join Products p
On c.CategoryId = p.CategoryId
Group by CategoryName
Order by TotalProducts Desc;

-- Question 21: Total customers per country/city
Select Country, City, Count(CustomerId) as TotalCustomers
From Customers
Group by City, Country
Order by Count(CustomerId) Desc;

-- Question 22: Products that need reordering
Select ProductId, ProductName, UnitsInStock, ReorderLevel
From Products 
Where UnitsInStock <= ReorderLevel;

-- Question 23: Products that need reordering, continued
Select ProductId, ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued
From Products
Where UnitsInStock + UnitsOnOrder <= ReorderLevel and Discontinued = 0 
Order by ProductId;

-- Question 24: Customer list by region
Select CustomerId, CompanyName, Region 
From Customers
Order by Case When Region is NULL Then 1 Else 0 End Asc;

-- Question 25: High freight charges
Select ShipCountry, Avg(Freight) as AverageFreight
from Orders
Group by ShipCountry
Order by Avg(Freight) Desc
Limit 3;

-- Question 26: High freight charges - 2015
Select ShipCountry, Avg(Freight) as AverageFreight
From Orders
Where OrderDate like '2015%'
Group by ShipCountry
Order by Avg(Freight) Desc
Limit 3;

-- Question 27: High freight charges with between
Select ShipCountry, Avg(Freight) as AverageFreight
From Orders
Where OrderDate between '20150101' and '20160101'
Group by ShipCountry
Order by Avg(Freight) Desc
Limit 3;

-- Question 28: High freight charges - last year
Select ShipCountry, Avg(Freight) as AverageFreight
From Orders
Where Date_Add((Select Max(OrderDate) From Orders), interval - 1 year)
Group by ShipCountry
Order by Avg(Freight) Desc
Limit 3;

-- Question 29: Employee/Order Detail report
Select o.EmployeeId, e.LastName, o.OrderId, p.ProductName, od.Quantity
From Orders o
Join OrderDetails od
On o.OrderId = od.OrderId
Join Products p
On od.ProductId = p.ProductId
Join Employees e
On o.EmployeeId = e.EmployeeId;

-- Question 30: Customers with no orders
Select c.CustomerId as Customer, o.CustomerId as Orders_Customer
From Customers c
Left Join Orders o
On o.CustomerId = c.CustomerId  
Where o.CustomerId is NULL;

-- Question 31: Customers with no orders for EmployeeId 4
Select c.CustomerId as CustomerOrder, o.CustomerId as Orders_Customer
From Customers c
Left Join Orders o
On o.CustomerId = c.CustomerId and EmployeeId = 4
Where o.CustomerId is NULL
Order by c.CustomerId; 
