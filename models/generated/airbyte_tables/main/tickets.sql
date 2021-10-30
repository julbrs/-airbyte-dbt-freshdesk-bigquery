{{ config(schema="main", tags=["top-level"]) }}
-- Final base SQL model
select
    'freshdesk' as source,
    id,
    status,
    created_at as createdAt,
    updated_at as updatedAt,
    _airbyte_emitted_at,
    _airbyte_freshdesk_tickets_hashid
from {{ ref('freshdesk_tickets_ab3') }}
-- freshdesk_tickets from {{ source('main', '_airbyte_raw_freshdesk_tickets') }}

