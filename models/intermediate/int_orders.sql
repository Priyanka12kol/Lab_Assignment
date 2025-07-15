select 
    o.id as order_id,
    customer_id,
    cast (o.ordered_at as date) as ordered_at,
    o.store_id,
            o.subtotal,
            items.sku 
          -- {{convert_currency(o.order_total,'eur')}} as order_total_eur,
         --  {{convert_currency(o.order_total,'yen')}} as order_total_yen,
           


from {{ref('stg_orders')}} as o
join {{ref('stg_order_items')}} as items
on order.id=items.order_id

