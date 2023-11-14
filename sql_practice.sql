/*Introductory problems
Question 1: Which shippers do we have?*/
select * from shippers

--Question 2: Certain fields from Categories?
select categoryname, description from categories

--Question 3: Sales representatives
select firstname, lastname, hiredate
from employees
where title = 'sales representative'

--Question 4: Sales representatives in United States
select firstname, lastname, hiredate
from employees
where title = 'sales representative' and country = 'USA' 

--Question 5: Orders placed by specific EmployeeID
select orderid, orderdate 
from orders
where employeeid = 5

--Question 6: Suppliers and contacttitles
select supplierid, contactname, contacttitle
from suppliers
where contacttitle != 'marketing manager'

--Question 7: Products with "queso" in productname
select productid, productname
from products
where productname like '%queso%'

--Question 8: Orders shipping to France or Belgium
select orderid, customerid, shipcountry
from orders
where shipcountry = 'france' or shipcountry = 'belgium'

--Question 9: Orders shipping to any country in Latin America
select orderid, customerid, shipcountry
from orders
where shipcountry in ('brazil', 'mexico', 'argentina', 'venezuela')

--Question 10: Employees, in order of age (oldest employees first)
select firstname, lastname, title, birthdate
from employees
order by birthdate asc

--Question 11: Slowly only the date with a datetime field
select firstname, lastname, title, convert(birthdate, date)
from employees
order by birthdate asc

--Question 12: Employees full name
select firstname, lastname, concat(firstname, ' ', lastname)
from employees

--Question 13: OrderDetails amount per line item
select orderid, productid, unitprice, quantity, (unitprice * quantity) as totalprice
from orderdetails

--Question 14: How many customers?
select count(customerid) as totalcustomers
from customers

--Question 15: When was the first order?
select min(orderdate) as firstorder
from orders

--Question 16: Countries where there are customers
select country
from customers
group by country

--Question 17: Contact titles for customers
select contacttitle, count(contacttitle) as totalcontacttitle
from customers
group by contacttitle
order by count(contacttitle) desc

--Question 18: Products with associated supplier names
select productid, productname, companyname as supplier
from suppliers s
join products p
on s.supplierid = p.supplierid

--Question 19: Orders and the shipper that was used
select orderid, orderdate, s.companyname as shipper
from orders o
join shippers s
on s.shipperid = o.shipvia
where orderid < 10270







































--Question 31: Customers with no orders for EmployeeID 4
select c.customerid, o.customerid as 'customerorder'
from customers c
left join orders o 
on c.customerid = o.customerid and o.employeeid = 4
where o.customerid is NULL 
order by c.customerid




