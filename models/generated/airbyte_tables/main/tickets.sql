{{ config(
    schema="main", 
    tags=["top-level"], 
    materialized='incremental', 
    unique_key='_airbyte_hashid', 
    on_schema_change='append_new_columns',
    ) }}
-- Final base SQL model
select
    'freshdesk' as source,
    id,
    (case when status=5 then "closed" else "open" end) as status,
    PARSE_TIMESTAMP("%FT%TZ", created_at) as created_at,
    PARSE_TIMESTAMP("%FT%TZ", updated_at) as updated_at,
    _airbyte_emitted_at,
    _airbyte_freshdesk_tickets_hashid as _airbyte_hashid
from {{ ref('freshdesk_tickets_ab3') }}
-- freshdesk_tickets from {{ source('main', '_airbyte_raw_freshdesk_tickets') }}

