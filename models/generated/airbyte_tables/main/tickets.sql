{{ config(
    schema="main", 
    tags=["top-level"], 
    materialized='incremental', 
    unique_key='_airbyte_hashid', 
    on_schema_change='append_new_columns',
    ) }}
-- Final base SQL model
select
    t.source,
    t.id,
    (case when t.status=5 then "closed" else "open" end) as status,
    PARSE_TIMESTAMP("%FT%TZ", t.created_at) as created_at,
    PARSE_TIMESTAMP("%FT%TZ", t.updated_at) as updated_at,
    COALESCE(stat.count_conversation_parts,0)+1 as count_conversation_parts,
    datetime_diff(stat.first_admin_answer, PARSE_TIMESTAMP("%FT%TZ", t.created_at), MINUTE) as first_response_time_min,
    datetime_diff(stat.last_answer, PARSE_TIMESTAMP("%FT%TZ", t.created_at), MINUTE) as total_response_time_min,
    t._airbyte_emitted_at,
    t._airbyte_freshdesk_tickets_hashid as _airbyte_hashid
from {{ ref('freshdesk_tickets_ab3') }} t
left join {{ ref('freshdesk_conversations_ab4') }} stat on t.id=stat.ticket_id
-- freshdesk_tickets from {{ source('main', '_airbyte_raw_freshdesk_tickets') }}

