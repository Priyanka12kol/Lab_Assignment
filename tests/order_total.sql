select
    *
from {{ ref('stg_orders') }}
where order_total<4