create database Flipcart;

-- Tasc 3.1
SELECT * FROM Flipcart.customers
where city = "Port Joeshire";

-- Tasc 3.2
SELECT * FROM Flipcart.products
where Category = "Fruits";

-- Tasc 4.1
alter table Flipcart.customers
add primary key (CustomerID);

-- Tasc 4.2
alter table Flipcart.customers
modify Age int not null;
alter table Flipcart.customers
add constraint Age18 check (age>=18);

-- Tasc 4.3
alter table Flipcart.customers
add Constraint unique_Name unique(Name);

-- Tasc 5
insert into Flipcart.products
(ProductID,ProductName,Category,SubCategory,PriceperUnit,StockQuantity,SupplierID)
values
(1,'Bag','Study_Material','Sub-Study_Material',3000,1,233),
(2,'pen','Study_Material','Sub-Study_Material',30,1,243),
(3,'pencil','Study_Material','Sub-Study_Material',5,1,253);
SELECT * FROM Flipcart.products;

-- Tasc 6
set up_stock_Quantity=0;
update Flipcart.products set StockQuantity=300
where ProductID="1";

SELECT * FROM Flipcart.products
where ProductID="1";

-- Tasc 7
delete from Flipcart.suppliers
where city = 'South Ana';
SELECT * FROM Flipcart.suppliers;

-- Tasc 8.1
alter table Flipcart.reviews
modify Rating 
Int check(Rating between 1 and 5);

-- Tasc 8.2
alter table flipcart.customers
modify PrimeMember varchar(3) default('No');

-- Tasc 9.1
SELECT * FROM Flipcart.orders
where OrderDate > '2024-01-01';

-- Tasc 9.2
select ProductID,avg(rating) as rating from flipcart.reviews
group by ProductID
having Rating>4;


-- Tasc 9.3
select productID,sum(Quantity * UnitPrice) as total_sales,
rank() over (order by sum(Quantity * UnitPrice)  desc) as sales_rank
from Flipcart.order_details
group by  productID
order by  sales_rank asc;

-- Tasc 10.1
select customerID,sum(orderAmount) as Total_Spending from Flipcart.orders
group by CustomerID;
SELECT * FROM Flipcart.orders;

-- Tasc 10.2
select customerID,sum(orderAmount) as total_spendings,
rank() over (order by sum(orderAmount) desc) as ranks
from flipcart.orders
group by customerID
order by ranks asc;

-- Tasc 10.3
select customerID,sum(orderAmount) as total_spendings from flipcart.orders
group by CustomerID having total_spendings > (5000) ;

-- Tasc 11.1
select o.OrderID,sum(od.Quantity * od.UnitPrice) as total_revenue
from flipcart.orders as o
inner join flipcart.order_details as od
on o.OrderID = od.OrderID
group by o.OrderID order by total_revenue desc;

-- Tasc 11.2
select CustomerID,count(*) as most_orders  from flipcart.orders
where OrderDate between "2024-01-01" and "2025-01-01"
group by CustomerID
order by most_orders desc;

-- Tasc 11.3
select SupplierID,sum(StockQuantity) as total_stock from flipcart.products
group by SupplierID order by total_stock desc limit 1;

-- Tasc 12.1

use flipcart;
create table categories(productID varchar(100),productName varchar(100),category varchar(100));
insert into flipcart.categories(ProductID,product_Name,category)
values ("0006853b-74cb-44a2-91ed-699aa31c5b5b","Particularly Baker","Bakery"),
("0219aafa-5dbc-4d92-acd9-8a78b4158651","Enter Dair","Dairy"),
("0297061c-1241-4540-ac99-ac6a44fa507e","We Baker","Bakery"),
("b75932b6-d9a8-48cc-adc0-7f30c6fc1b50","Able Mea","Meat"),
("574d9b9b-794c-40c9-a892-462dc6c4b106","Above Mea","Meat"),
("0219aafa-5dbc-4d92-acd9-8a78b4158651","Enter Dair","Dairy"),
("0297061c-1241-4540-ac99-ac6a44fa507e","We Baker","Bakery"),
("b75932b6-d9a8-48cc-adc0-7f30c6fc1b50","Able Mea","Meat"),
("574d9b9b-794c-40c9-a892-462dc6c4b106","Above Mea","Meat");

SELECT * FROM Flipcart.categories;

-- Tasc 12.2
create table subcategories(productID varchar(100),subcategory varchar(100));
insert into flipcart.subcategories(productID,subcategory)
values 
("b75932b6-d9a8-48cc-adc0-7f30c6fc1b50","Sub-Meat-2"),
("b59590c7-c1e0-47c5-a99e-eedef51e80fc","Sub-Meat-2"),
("b8aced22-3877-4756-ac1e-6f078d5b8f48","Sub-Vegetables-4"),
("bcf5cc36-0e00-47d4-ba0f-21f784b82b0f","Sub-Snacks-2"),
("574d9b9b-794c-40c9-a892-462dc6c4b106","Sub-Meat-1");

-- Tasc 13.1
SET SQL_SAFE_UPDATES = 0;
alter table flipcart.categories
add primary key (productID);
alter table flipcart.subcategories
add foreign key (productID) references flipcart.categories (productID);

-- Tasc 13.2
select productID,sum(quantity*UnitPrice) as Sales_Profit from flipcart.order_details
group by ProductID order by Sales_Profit desc limit 3;

-- Tasc 14.1
select City,count(PrimeMember)  from flipcart.customers 
where PrimeMember = "Yes"
group by City order by Primemember desc;

-- Tasc 14.2
select Category,count(StockQuantity) as total_quantity
from flipcart.products
group by Category
order by total_quantity desc limit 3;












