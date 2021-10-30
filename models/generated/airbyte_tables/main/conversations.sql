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
    'unknown' as type,
    ticket_id,
    PARSE_TIMESTAMP("%FT%TZ", created_at) as created_at,
    _airbyte_emitted_at,
    _airbyte_freshdesk_conversations_hashid as _airbyte_hashid
from {{ ref('freshdesk_conversations_ab3') }}
-- freshdesk_conversations from {{ source('main', '_airbyte_raw_freshdesk_conversations') }}

