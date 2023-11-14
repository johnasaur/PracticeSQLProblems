/*Intermediate Problems
Question 20: Categories, and the total products in each category*/
select categoryname, count(productid) as totalproducts
from categories c
join products p
on c.categoryid = p.categoryid
group by categoryname
order by totalproducts desc;

-- Question 21: Total customers per country/city
select country, city, count(customerid) as totalcustomers
from customers
group by city, country
order by count(customerid) desc;

-- Question 22: Products that need reordering
select productid, productname, unitsinstock, reorderlevel
from products 
where unitsinstock <= reorderlevel;

-- Question 23: Products that need reordering, continued
select productid, productname, unitsinstock, unitsonorder, reorderlevel, discontinued
from products
where unitsinstock + unitsonorder <= reorderlevel and discontinued = 0 
order by productid;

-- Question 24: Customer list by region
select customerid, companyname, region 
from customers
order by case when region is null then 1 else 0 end asc;

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
Select c.CustomerId as Customer, o.CustomerId as Orders_Customer
From Customers c
Left Join Orders o
On o.CustomerId = c.CustomerId and EmployeeId = 4
Where o.CustomerId is NULL
Order by c.CustomerId; 




