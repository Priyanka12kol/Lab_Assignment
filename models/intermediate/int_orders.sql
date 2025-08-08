{{
    config(
        materialized='incremental'
    )
}}

with src as 
(
    select
    *
from {{ ref('stg_orders') }}
{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  -- (uses >= to include records whose timestamp occurred since the last run of this model)
  -- (If event_time is NULL or the table is truncated, the condition will always be true and load all records)
where ordered_at >= (select coalesce(max(ordered_at),'1900-01-01') from {{ this }} )

{% endif %}
)

select * from src