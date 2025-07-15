with ord as (
    select id,
            customer_id,
            cast (ordered_at as date) as ordered_at,
            store_id,
            subtotal,
            (tax_paid/subtotal)*100 as tax_paid,
            (order_total/subtotal)*100 as order_total
             from {{source('src','orders')}}
    where order_total<>0

)

select * from  ord 