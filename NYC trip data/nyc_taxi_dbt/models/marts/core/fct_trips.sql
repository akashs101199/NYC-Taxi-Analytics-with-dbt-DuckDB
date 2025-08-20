-- models/marts/core/fct_trips.sql
{{ config(
    materialized='incremental',
    unique_key=['pickup_ts','pu_location_id','do_location_id','vendor_id']
) }}

with src as (
  select * from {{ ref('int_yellow_enriched') }}
  {% if is_incremental() %}
    where pickup_date >= date_trunc('month', current_date - interval 30 day)
  {% endif %}
)
select * from src
