{{ config(schema="main", tags=["top-level"]) }}
-- Final base SQL model
select
    'freshdesk' as source,
    id,
    (case when category = 3  then 'agent' else 'customer' end) as type,
    ticket_id,
    created_at,
    updated_at,
    _airbyte_emitted_at,
    _airbyte_freshdesk_conversations_hashid
from {{ ref('freshdesk_conversations_ab3') }}
-- freshdesk_conversations from {{ source('main', '_airbyte_raw_freshdesk_conversations') }}

