-- models/marts/core/agg_daily_metrics.sql
select
  pickup_date,
  count(*)                              as trips,
  avg(trip_minutes)                     as avg_trip_minutes,
  avg(trip_distance_mi)                 as avg_distance_mi,
  avg(tip_per_mile)                     as avg_tip_per_mile,
  sum(total_amount)                     as gross_total_amount
from {{ ref('fct_trips') }}
group by 1
