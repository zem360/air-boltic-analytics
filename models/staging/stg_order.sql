
select
    "Order ID" as order_id,
    "Customer ID" as customer_id,
    "Trip ID" as trip_id,
    "Price (EUR)" as price_eur,
    "Seat No" as seat_no,
    "Status" as status
from {{ref('order')}}