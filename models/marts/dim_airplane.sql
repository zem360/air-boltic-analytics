{{
    config(
        materialized='table',
        schema='marts'
    )
}}

select
    a.airplane_id, 
    am.airplane_model_id,
    a.manufacturer
from {{ ref('stg_airplane') }} a
left join {{ ref('dim_airplane_model') }} am
    on a.airplane_model = am.model
    and a.manufacturer = am.manufacturer