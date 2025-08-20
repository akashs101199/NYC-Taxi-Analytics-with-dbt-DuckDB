-- models/staging/stg_yellow_union.sql
select * from {{ ref('stg_yellow_2024_01') }}
union all
select * from {{ ref('stg_yellow_2024_02') }}
union all
select * from {{ ref('stg_yellow_2024_03') }}
