
with cust as (
    select * from {{source('src','customers')}}

)

select * from cust