{{ config(schema="_airbyte_main", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    {{ dbt_utils.surrogate_key([
        'id',
        boolean_to_string('spam'),
        array_to_string('tags'),
        'type',
        'due_by',
        'source',
        'status',
        'subject',
        'group_id',
        'priority',
        array_to_string('cc_emails'),
        'fr_due_by',
        'nr_due_by',
        array_to_string('to_emails'),
        'company_id',
        'created_at',
        array_to_string('fwd_emails'),
        'product_id',
        'updated_at',
        'description',
        boolean_to_string('fr_escalated'),
        boolean_to_string('is_escalated'),
        boolean_to_string('nr_escalated'),
        'requester_id',
        'responder_id',
        'custom_fields',
        'email_config_id',
        array_to_string('reply_cc_emails'),
        'association_type',
        'description_text',
        array_to_string('ticket_cc_emails'),
        'associated_tickets_count',
    ]) }} as _airbyte_freshdesk_tickets_hashid,
    tmp.*
from {{ ref('freshdesk_tickets_ab2') }} tmp
-- freshdesk_tickets

