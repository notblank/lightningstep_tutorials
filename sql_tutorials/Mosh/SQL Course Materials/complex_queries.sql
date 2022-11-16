-- Exo: sql_hr, find all employees who earn more than average.
use sql_hr;
show tables;

select * from employees limit 3;

select *
    from  employees
    where salary > (
        select avg(salary) 
        from employees
    )
    order by salary;


-- Exo: all clients without invoices
use sql_invoicing;
show tables;
show columns from invoices;

select * 
    from clients 
    where client_id not in (
        select distinct client_id
        from invoices
    );

-- Exo: sql_store: customer who ordered lettuce (id = 3)
use sql_store;
show tables;

show columns from customers;
show columns from order_items;

select customer_id, first_name, last_name
    from customers 
    where customer_id in (
        select customer_id 
        from orders 
        where order_id in (
            select order_id
            from order_items
            where product_id = 3
        )
    );

select distinct c.customer_id, c.first_name, c.last_name
    from customers c
    join orders o
    using (customer_id)
    join order_items oi
    using (order_id)
    where oi.product_id = 3;

-- Exo: employees with salary > avg(office)
use sql_hr;
show tables;

select * from employees
    limit 3;

select * 
    from employees
    where salary > all (
        select avg(salary) 
        from employees
        group by office_id
    );

-- correlated q's Exo: invoices than the client's average invoice amount
use sql_invoicing;
show tables;

select * from invoices limit 5;

select * 
    from invoices i
    where invoice_total > (
        select avg(invoice_total)
        from invoices
        where client_id = i.client_id
    );

-- exists Exo: find products that haver never been ordered
use sql_store;
show tables;
show columns from order_items;

select * 
    from products p
    where not exists (
        select product_id 
        from order_items
        where product_id = p.product_id
    );


-- SQ inside select Exo: for each client compute total sales, avg sales and
-- then, compute the difference between both cols.
show databases;
use sql_invoicing;
show tables;
show columns from invoices;

select 
    client_id, 
    name,
    (select sum(invoice_total) 
        from invoices 
        where client_id = c.client_id) as total_sales,
    (select avg(invoice_total)
            from invoices) as avg_sales,
    (select total_sales - avg_sales) as difference
    from clients c;

-- update on join after summary
use sql_store;
show tables;

show columns from customers;
show columns from order_items;


select order_id, product_id as min_prod
            from order_items
            order by order_id;

select o.customer_id, o.order_id
    from orders o;

select o.customer_id, o.order_id, op.min_prod
    from orders o
    join 
        (select order_id, min(product_id) as min_prod
            from order_items
            group by order_id ) op using (order_id);

update orders o
    join 
        (select order_id, min(product_id) as min_prod
            from order_items
            group by order_id ) op using (order_id)
    set order_id = min_prod + floor(rand() * 1000);

select order_id from orders;
