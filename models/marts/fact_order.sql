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
    case
        when upper(right(o.seat_no, 1)) in ('A', 'F') then 'window'
        when upper(right(o.seat_no, 1)) in ('C', 'D') then 'aisle'
        else 'middle'
    end as seat_position,
    case
        when lower(o.status) in ('cancelled', 'canceled') then true
        else false
    end as is_cancelled,
    c.customer_group_id,
    cg.type          as customer_group_type,
    cg.name          as customer_group_name,
    cg.is_corporate  as is_corporate_customer,
    t.start_time as trip_start_time,
    t.end_time   as trip_end_time,
    cast(t.start_time as date)       as trip_date,
    extract(dow   from t.start_time) as trip_day_of_week,
    extract(month from t.start_time) as trip_month,
    extract(year  from t.start_time) as trip_year

from {{ ref('stg_order') }} o
left join {{ ref('dim_customer') }} c  
    on c.customer_id = o.customer_id
left join {{ ref('dim_customer_group') }} cg 
    on cg.customer_group_id = c.customer_group_id
left join {{ ref('fact_trip') }} t  
    on t.trip_id = o.trip_id