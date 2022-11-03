-- Exo: view with the balance for each table
show databases;
use sql_invoicing;
show tables;

select * from invoices limit 3;

create view client_balance as
    select i.client_id, c.name, 
        sum(i.invoice_total - i.payment_total) as balance
        from invoices i
        join clients c
        using (client_id)
        group by i.client_id;

show full tables;

select * from client_balance;
