{{
    config(
        materialized='table',
    )
}}


select
    customer_group_id,
    name,
    type,
    registry_number,
    case
        when type ='Company' then true
        else false
    end as is_corporate
from {{ ref('stg_customer_group') }}