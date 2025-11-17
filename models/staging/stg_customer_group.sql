
select
    "ID" as customer_group_id,
    "Name" as name,
    "Type" as type,
    "Registry number" as registry_number
from {{ ref('customer_group') }}