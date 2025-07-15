select 
    order.id as order_id,
    customer_id,
    cast (order.ordered_at as date) as ordered_at,
    order.store_id,
            order.subtotal,
            items.sku,
            {{convert_currency(order.order_total,'eur')}} as order_total_eur,
            {{convert_currency(order.order_total,'yen')}} as order_total_yen,
            order.order_total


from {{ref('stg_orders')}} as order
inner join {{ref('stg_order_items')}} as items
on order.id=items.order_id

