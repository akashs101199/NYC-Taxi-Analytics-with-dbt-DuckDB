{% snapshot daily_metrics_snapshot %}
{{
  config(
    target_schema='snapshots',
    unique_key='pickup_date',
    strategy='timestamp',
    updated_at='updated_at'
  )
}}
select
  pickup_date,
  trips,
  avg_trip_minutes,
  avg_distance_mi,
  avg_tip_per_mile,
  gross_total_amount,
  current_timestamp as updated_at
from {{ ref('agg_daily_metrics') }}
{% endsnapshot %}