-- Exo: retreive orders placed in current year.
show databases;
use sql_store;
show tables;

show columns from orders;

select order_id, order_date 
    from orders
    where year(order_date) = '2018';
    --where year(order_date) = year(now());

-- Exo: prod_id, name, number of times orderes, many times/once 
show tables;

select * from order_items limit 3;

select product_id, 
    count(product_id) as orders,
    if(count(product_id) > 2, 'many times', 'once')
    from order_items
    group by product_id;

-- Exo: silver, bronze, gold customers.
show tables;
show columns from customers;

select first_name, points,
    case 
        when points < 2000 then 'bronze'
        when (points between 2000 and 3000) then 'silver'
        when points > 3000 then 'gold'
    end as category
    from customers 
    order by points;

