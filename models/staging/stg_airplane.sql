
select
    "Airplane ID" as airplane_id,
    "Airplane Model" as airplane_model,
    "Manufacturer" as manufacturer
from {{ ref ('aeroplane')}}