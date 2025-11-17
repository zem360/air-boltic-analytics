{{
    config(
        materialized='table'
    )
}}


select
    {{ dbt_utils.generate_surrogate_key(['manufacturer', 'model']) }} as airplane_model_id,
    manufacturer,
    model,
    max_seats,
    max_weight,
    max_distance,
    engine_type
from {{ ref('stg_airplane_model') }} 