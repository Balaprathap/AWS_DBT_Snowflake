{{ config(
    materialized='incremental',
    unique_key='HOST_ID'
) }}

select
    host_id,
    replace(host_name, ' ', '_') as host_name,
    host_since as host_since,
    is_superhost as is_superhost,
    response_rate as response_rate,

    case
        when response_rate > 95
        then 'VERY_GOOD'
        when response_rate > 80
        then 'GOOD'
        when response_rate > 60
        then 'FAIR'
        else 'POOR'
    end as response_rate_quality,

    created_at as created_at

from {{ ref('bronze_hosts') }}
