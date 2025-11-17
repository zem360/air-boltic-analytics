
{{
    config(
        materialized='table',
    )
}}

select
    c.customer_id,
    c.name,
    c.customer_group_id,
    c.email,
    regexp_replace(c.phone_number, '[^0-9]', '', 'g') as phone_number_cleaned,
    g.is_corporate
from {{ ref('stg_customer') }} c
left join {{ ref('dim_customer_group') }} g
  on c.customer_group_id = g.customer_group_id