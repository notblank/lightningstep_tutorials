show columns from sql_store.orders;
show columns from customers;

select order_id, first_name, last_name from 
    sql_store.orders o
    inner join
    customers c
    on 
    c.customer_id = o.customer_id;

-- Exo: retreive quantity and unit price to order information

show columns from sql_store.orders;
show columns from sql_store.order_items;

select o.order_id, product_id, quantity, unit_price from 
    sql_store.order_items i
    inner join 
    sql_store.orders o
    on o.order_id = i.order_id
    limit 7;

show tables from sql_hr;

show columns from sql_hr.employees;

select e.first_name as employee, m.first_name as manager from 
    sql_hr.employees e
    join 
    sql_hr.employees m
    on e.reports_to = m.employee_id 
    limit 10;


--- triple join
use sql_store;
show tables;

show columns from customers;
show columns from orders;
show columns from order_statuses;

select * from order_statuses;

select o.order_id, o.order_date, 
    c.first_name, c.last_name,
    s.name
    from 
    orders o join customers c
    on o.customer_id = c.customer_id
    join
    order_statuses s
    on 
    o.status = s.order_status_id;

-- Exo: table with product id, product name and quantity.
-- show all products, even those that haven't been ordered.
show columns from products;
show columns from order_items;
show tables;

select  from orders limit 10;

select p.product_id, p.name, oi.quantity
    from 
    products p
    left join 
    order_items oi
    on oi.product_id = p.product_id;

-- Exo: table with:
-- order_date, order_id, first_name, shipper, order status
show tables;
show columns from orders;
show columns from shippers;
show columns from customers;
show columns from order_statuses;

select o.order_id, o.order_date,
    c.first_name, s.name,
    os.name
    from orders o
    join customers c
    on o.customer_id = c.customer_id
    left join shippers s
    on o.shipper_id = s.shipper_id
    left join order_statuses os
    on o.status = os.order_status_id;

-- Exo: cross product between shippers and products
show tables;
show columns from shippers;
show columns from products;

select s.name, p.name from 
    shippers s
    cross join
    products p;

-- Unions

select order_id, order_date, 'active' as status
    from orders 
    where order_date >= '2019-01-01'

union 

select order_id, order_date, 'archived' as status
    from orders 
    where order_date < '2019-01-01';

-- Exo: table with id, customer name, points, type: < 2000 - 3000 < 
show columns from customers;

select customer_id, first_name, points, 'bonze' as type
    from customers 
    where points < 2000
union
select customer_id, first_name, points, 'silver' as type
    from customers 
    where points between 2000 and 3000
union
select customer_id, first_name, points, 'gold' as type
    from customers 
    where points > 3000
order by first_name;

