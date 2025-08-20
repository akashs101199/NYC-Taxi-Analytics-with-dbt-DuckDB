with src as (
  select *
  from read_parquet('https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2024-02.parquet')
)
select
  cast(vendorid as int)                         as vendor_id,
  cast(tpep_pickup_datetime as timestamp)       as pickup_ts,
  cast(tpep_dropoff_datetime as timestamp)      as dropoff_ts,
  cast(passenger_count as int)                  as passenger_count,
  cast(trip_distance as double)                 as trip_distance_mi,
  cast(pulocationid as int)                     as pu_location_id,
  cast(dolocationid as int)                     as do_location_id,
  cast(fare_amount as double)                   as fare_amount,
  cast(extra as double)                         as extra,
  cast(mta_tax as double)                       as mta_tax,
  cast(tip_amount as double)                    as tip_amount,
  cast(tolls_amount as double)                  as tolls_amount,
  cast(improvement_surcharge as double)         as improvement_surcharge,
  cast(total_amount as double)                  as total_amount,
  cast(payment_type as int)                     as payment_type,
  cast(congestion_surcharge as double)          as congestion_surcharge
from src
where pickup_ts is not null and dropoff_ts is not null