
use sql_store;

show tables;

select * from customers;

-- Show table description
describe customers;

show columns from customers;

-- show full columns from customers;

select customer_id, first_name from customers;

-- Exo: Explore invoces database

-- Select Statements:

select state from customers;

-- Exo: return all products with name, unit price and 110% unit price 

select customer_id, last_name from customers 
    where last_name like 'b%';

select customer_id, last_name from customers 
    where last_name regexp '^b';

select customer_id, last_name, phone from customers 
    where phone is null;
    
show columns from sql_store.orders;

-- orders haven't been shipped:
select order_id, shipped_date from sql_store.orders
    where shipped_date is null; 

-- order by
-- can order by even if col is not selected:
select first_name, last_name from customers
    order by birth_date;

select first_name, last_name, 10 as points from customers
    order by birth_date, points;

-- Exo: Get the top 3 loyal customers:
show columns from customers;

select first_name, last_name, points from customers
    order by points desc
    limit 3;

