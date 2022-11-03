-- list of stored procedures:
select 
    routine_schema as "Database",
    routine_name,
    routine_type
    from information_schema.routines;

-- Exo: stored procedure to get all invoices with balance > 0
DROP PROCEDURE IF EXISTS get_invoices_with_balance;

delimiter $$
create procedure get_invoices_with_balance ()
    begin
        select * 
            from client_balance
            where balance > 0;
    end $$
delimiter ;

call get_invoices_with_balance();

-- Exo: get_invoices_by_client
use sql_invoicing;
show tables;
show columns from invoices;

drop procedure if exists get_invoices_by_client;
delimiter $$
create procedure get_invoices_by_client (client_id INT) 
    begin
        select i.client_id, i.number, i.invoice_total
            from invoices i
            where i.client_id = client_id; 
    end $$
delimiter ;

call get_invoices_by_client(3);

-- Exo: get_payments(client_id, payment_method_id)
show tables;
show columns from payments;

drop procedure if exists get_payments;
delimiter $$
create procedure get_payments(client_id INT(4), payment_method tinyint(1))
    begin
        select p.client_id, p.payment_method
            from payments p
            where 
                p.client_id = ifnull(client_id, p.client_id) and 
                p.payment_method = ifnull(payment_method, p.payment_method);
    end $$
delimiter ;

call get_payments(null, null);
