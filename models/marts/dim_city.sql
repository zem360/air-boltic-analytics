{{
    config(
        materialized='table',
    )
}}


with all_cities as (

    select origin_city as city_name
    from {{ ref('stg_trip') }}

    union

    select destination_city as city_name
    from {{ ref('stg_trip') }}

)


select
    row_number() over (order by city_name) as city_id,
    city_name,
    null as country,
    null as region
from all_cities