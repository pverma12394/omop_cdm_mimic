with triage as (
    select *
    from {{ source('omop_raw', 'triage') }}
),

vitalsign as (
    select *
    from {{ source('omop_raw', 'vitalsign') }}
),

measurement as (
    {{ map_triage_measurement('temperature', 0) }}
    union all
    {{ map_triage_measurement('heartrate', 0) }}
    union all
    {{ map_triage_measurement('resprate', 0) }}
    union all
    {{ map_triage_measurement('o2sat', 0) }}
    union all
    {{ map_triage_measurement('sbp', 0) }}
    union all
    {{ map_triage_measurement('dbp', 0) }}
    union all
    {{ map_triage_measurement('pain', 0) }}

    union all

    {{ map_vitalsign_measurement('temperature', 0) }}
    union all
    {{ map_vitalsign_measurement('heartrate', 0) }}
    union all
    {{ map_vitalsign_measurement('resprate', 0) }}
    union all
    {{ map_vitalsign_measurement('o2sat', 0) }}
    union all
    {{ map_vitalsign_measurement('sbp', 0) }}
    union all
    {{ map_vitalsign_measurement('dbp', 0) }}
    union all
    {{ map_vitalsign_measurement('pain', 0) }}
    union all
    {{ map_vitalsign_measurement('rhythm', 0) }}
)

select * from measurement
