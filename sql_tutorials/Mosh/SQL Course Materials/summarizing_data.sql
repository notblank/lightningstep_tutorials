-- Exo: total sales, total payments, and expected payments for:
-- first and second halves and total.

show databases;
use sql_invoicing;
show tables;
show columns from invoices;


select 
    sum(invoice_total) as total_sales,
    sum(payment_total) as total_payments,
    sum(invoice_total - payment_total) as expected_payments
    from invoices
    where invoice_date > '2019-07-01'
union
select 
    sum(invoice_total) as total_sales,
    sum(payment_total) as total_payments,
    sum(invoice_total - payment_total) as expected_payments
    from invoices
    where invoice_date < '2019-07-01';


-- Exo: total payments for each day and payment method
show tables;
show columns from payment_methods;

select date, pm.name, 
    sum(amount) as total_payments
from payments p
join payment_methods pm
on p.payment_method = pm.payment_method_id
group by date, payment_method;

-- Exo: total by order.
show databases;
show tables;
show tables from sql_invoicing;
show columns from customers;
show columns from orders;

select oi.order_id,
    sum(oi.unit_price * oi.quantity) as total,
    c.first_name, c.state
    from order_items oi
    join orders o
    using (order_id)
    join customers c 
    using (customer_id)
    group by oi.order_id
    order by first_name;

-- Exo: total for each payment method with rollup
show tables from sql_invoicing;
use sql_invoicing;
show columns from payments;
show columns from payment_methods;

select pm.name,
    sum(p.amount) as total
    from payments p
    join payment_methods pm
    on p.payment_method = pm.payment_method_id
    group by payment_method with rollup;
