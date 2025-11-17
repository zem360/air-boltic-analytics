
select
    manufacturer,
    model,
    max_seats,
    max_weight,
    max_distance, 
    engine_type  
from {{ ref('aeroplane_model')}}