with prd as (
        select id,sku,
        name,
        type,
        price,
        description
        from {{source('src','products')}}


)

select *,
        price/100 as product_price,
        case when type='jaffle' then 1 else 0 end as is_food_item,
        case when type='beverage' then 1 else 0 end as is_drink_item
 from prd