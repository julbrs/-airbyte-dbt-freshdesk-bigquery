{{ config(schema="_airbyte_main", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    {{ dbt_utils.surrogate_key([
        'id',
        'body',
        'source',
        boolean_to_string('private'),
        'user_id',
        'category',
        boolean_to_string('incoming'),
        'body_text',
        array_to_string('cc_emails'),
        'ticket_id',
        array_to_string('to_emails'),
        array_to_string('bcc_emails'),
        'created_at',
        'from_email',
        'updated_at',
        array_to_string('attachments'),
        'support_email',
        'source_additional_info',
    ]) }} as _airbyte_freshdesk_conversations_hashid,
    tmp.*
from {{ ref('freshdesk_conversations_ab2') }} tmp
-- freshdesk_conversations

