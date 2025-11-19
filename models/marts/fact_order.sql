{{
    config(
        materialized='table' 
    )
}}

select
    o.order_id,
    o.customer_id,
    o.trip_id,
    o.price_eur,
    o.seat_no,
    o.status,
    c.customer_group_id,
    case
        when upper(right(o.seat_no, 1)) in ('A', 'F') then 'window'
        when upper(right(o.seat_no, 1)) in ('C', 'D') then 'aisle'
        else 'middle'
    end as seat_position,
    case
        when lower(o.status) in ('cancelled', 'canceled') then true
        else false
    end as is_cancelled,
    case
        when lower(o.status) = 'booked' then true
        else false
    end as is_booked,
    case
        when lower(o.status) = 'finished' then true
        else false
    end as is_finished,
    cast(t.start_time as date)       as trip_date,

from {{ ref('stg_order') }} o
left join {{ ref('dim_customer') }} c  
    on c.customer_id = o.customer_id
left join {{ ref('fact_trip') }} t  
    on t.trip_id = o.trip_id

{#
Note to self : There should be an incremental filter here, but there is no order date field to filter on.

{% if is_incremental() %}
  where o.order_date > (select max(o.order_date) from {{ this }})
{% endif %} ---

#}