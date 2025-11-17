{{
    config(
        materialized='table',
    )
}}

select
    t.trip_id,
    oc.city_id as origin_city_id,
    dc.city_id as destination_city_id,
    t.airplane_id,
    t.start_time,
    t.end_time,
    date_diff('hour',t.start_time, t.end_time) as trip_duration_hours,
    case
        when date_diff('hour', t.start_time, t.end_time) < 2 then 'short'
        when date_diff('hour', t.start_time, t.end_time) < 5 then 'mid'
        else 'long'
    end as trip_duration_category,
    cast(t.start_time as date) as trip_date,
    case
        when cast(t.start_time as date) <> cast(t.end_time as date) then true
        else false
    end as is_overnight_trip,
    case
        when extract(dow from t.start_time) in (0, 6) then true
        else false
    end as is_weekend_trip

from {{ ref('stg_trip') }} as t
left join {{ ref('dim_city') }} as oc 
    on oc.city_name = t.origin_city
left join {{ ref('dim_city') }} as dc
    on dc.city_name = t.destination_city
