-- Exo: insert 3 products
show columns from products;

insert into products (name, quantity_in_stock, unit_price) 
values ('prod1', 10,.50), ('prod2', 2, 10.2);

select * from products;

-- Hierarchical inserts
show columns from orders;

insert into orders (customer_id, order_date, status)
values ('1', '2019-01-01', 1);

show columns from order_items;
-- get order id for the order items
select last_insert_id();

insert into order_items
values (last_insert_id(), 1, 3, 2.0);

-- Copy tables
create table orders_archived as 
select * from orders;

truncate orders_archived;
select * from orders_archived;

show columns from orders_archived;

insert into orders_archived
select * from orders
    where order_date < '2019-01-01';

-- Exo: Crete a table of invoices with a payment with clients name
show databases;
use invoicing;
show tables;

show columns from invoices;
show columns from clients;

select payment_date from invoices;

select c.name, 
    i.invoice_id, i.invoice_total, i.payment_date from 
    invoices i
    join 
    clients c
    on i.client_id =  c.client_id
    where payment_date is not null 
    limit 10;

-- Exo: Update orders comments for customers with more than 3000 points.
show databases;
use sql_store;
show tables;
show columns from orders;

update orders 
    set comments = "Gold Customer: You have more than 3000 points"
    where customer_id in 
        (select customer_id from customers 
            where points > 3000);

select customer_id, comments from orders;

