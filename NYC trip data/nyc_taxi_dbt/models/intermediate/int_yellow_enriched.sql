{{ config(materialized='view') }}

with trips as (
  select * from {{ ref('stg_yellow_union') }}
),
derived as (
  select
    *,
    datediff('minute', pickup_ts, dropoff_ts) as trip_minutes,
    case
      when trip_distance_mi > 0
      then tip_amount / nullif(trip_distance_mi, 0)
    end as tip_per_mile,
    case
      when datediff('minute', pickup_ts, dropoff_ts) > 0
      then total_amount / datediff('minute', pickup_ts, dropoff_ts)
    end as revenue_per_min,
    date_trunc('day', pickup_ts) as pickup_date
  from trips
)
select *
from derived
where trip_minutes between 1 and 180
  and trip_distance_mi between 0.1 and 100
