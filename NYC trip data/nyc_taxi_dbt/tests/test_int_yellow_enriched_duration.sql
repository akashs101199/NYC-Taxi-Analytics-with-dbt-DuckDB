-- tests/test_int_yellow_enriched_duration.sql
with data as (
    select
        pickup_ts,
        dropoff_ts,
        datediff('minute', pickup_ts, dropoff_ts) as calc_duration
    from {{ ref('int_yellow_enriched') }}
)
select *
from data
where calc_duration < 0
