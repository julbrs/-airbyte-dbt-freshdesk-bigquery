{{ config(schema="_airbyte_main", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    ticket_id,
    count(id) as count_conversation_parts,
    min(PARSE_TIMESTAMP("%FT%TZ", created_at)) as first_admin_answer,
    max(PARSE_TIMESTAMP("%FT%TZ", created_at)) as last_answer,
from {{ ref('freshdesk_conversations_ab2') }}
group by ticket_id
-- freshdesk_conversations

