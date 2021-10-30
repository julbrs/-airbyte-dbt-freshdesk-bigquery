{{ config(schema="_airbyte_main", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    cast(id as {{ dbt_utils.type_string() }}) as id,
    {{ cast_to_boolean('spam') }} as spam,
    tags,
    cast(type as {{ dbt_utils.type_string() }}) as type,
    cast(due_by as {{ dbt_utils.type_string() }}) as due_by,
    cast(source as {{ dbt_utils.type_bigint() }}) as source,
    cast(status as {{ dbt_utils.type_bigint() }}) as status,
    cast(subject as {{ dbt_utils.type_string() }}) as subject,
    cast(group_id as {{ dbt_utils.type_bigint() }}) as group_id,
    cast(priority as {{ dbt_utils.type_bigint() }}) as priority,
    cc_emails,
    cast(fr_due_by as {{ dbt_utils.type_string() }}) as fr_due_by,
    cast(nr_due_by as {{ dbt_utils.type_string() }}) as nr_due_by,
    to_emails,
    cast(company_id as {{ dbt_utils.type_bigint() }}) as company_id,
    cast(created_at as {{ dbt_utils.type_string() }}) as created_at,
    fwd_emails,
    cast(product_id as {{ dbt_utils.type_bigint() }}) as product_id,
    cast(updated_at as {{ dbt_utils.type_string() }}) as updated_at,
    cast(description as {{ dbt_utils.type_string() }}) as description,
    {{ cast_to_boolean('fr_escalated') }} as fr_escalated,
    {{ cast_to_boolean('is_escalated') }} as is_escalated,
    {{ cast_to_boolean('nr_escalated') }} as nr_escalated,
    cast(requester_id as {{ dbt_utils.type_bigint() }}) as requester_id,
    cast(responder_id as {{ dbt_utils.type_bigint() }}) as responder_id,
    cast(custom_fields as {{ type_json() }}) as custom_fields,
    cast(email_config_id as {{ dbt_utils.type_bigint() }}) as email_config_id,
    reply_cc_emails,
    cast(association_type as {{ dbt_utils.type_bigint() }}) as association_type,
    cast(description_text as {{ dbt_utils.type_string() }}) as description_text,
    ticket_cc_emails,
    cast(associated_tickets_count as {{ dbt_utils.type_bigint() }}) as associated_tickets_count,
    _airbyte_emitted_at
from {{ ref('freshdesk_tickets_ab1') }}
-- freshdesk_tickets

