
select
    "Customer ID" as customer_id,
    "Name" as name,
    "Customer Group ID" as customer_group_id,
    "Email" as email,
    "Phone Number" as phone_number
from {{ ref('customer') }}