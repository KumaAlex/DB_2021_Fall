--a

select products.name, sum(amount) as res_amount
from products, basket
where products.upc_code = basket.upc_code
group by products.name
order by sum(amount) desc
limit 20;

--b

select stores.city, sum(amount)
from stores, basket
where stores.store_id = basket.store_id
group by stores.city
order by sum(amount) desc
limit 20;

--c

select stores.store_name, sum(amount)
from stores, basket
where stores.store_id = basket.store_id
group by stores.store_name
order by sum(amount) desc
limit 5;

--d

create view bananas as
    select stores.store_name, sum(amount) as amount
    from stores, basket
    where basket.upc_code = 67132 and stores.store_id = basket.store_id
    group by stores.store_name;

create view lemons as
    select stores.store_name, sum(amount) as amount
    from stores, basket
    where basket.upc_code = 1040302 and stores.store_id = basket.store_id
    group by stores.store_name;

select lemons.store_name, lemons.amount, bananas.amount
from bananas, lemons
where lemons.store_name = bananas.store_name and bananas.amount > lemons.amount;

drop view bananas;
drop view lemons;

--e

select products.name, types.type_name
from products, types, prod_types
where products.upc_code = prod_types.upc_code and types.type_id = prod_types.type_id and types.type_name = 'dairy products';

select products.name, types.type_name, sum(basket.amount) as amount
from products, types, prod_types, basket
where products.upc_code = prod_types.upc_code and types.type_id = prod_types.type_id and types.type_name = 'dairy products' and
      basket.upc_code = products.upc_code
group by products.name, types.type_name
order by amount desc;