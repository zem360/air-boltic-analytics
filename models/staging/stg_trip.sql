
select
    "Trip ID" as trip_id, 
    "Origin City" as origin_city, 
    "Destination City" as destination_city ,
    "Airplane ID" as airplane_id,  
    "Start Timestamp" as start_time,    
    "End Timestamp" as end_time
from {{ref('trip')}}