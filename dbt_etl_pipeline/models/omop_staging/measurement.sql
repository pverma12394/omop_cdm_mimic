{{ config(
    schema='_harmonised'
) }}

with triage as (
    select *
    from {{ source('mimic_iv_ed', 'triage') }}
),

vitalsign as (
    select *
    from {{ source('mimic_iv_ed', 'vitalsign') }}
),

measurement as (
    {{ map_measurement('triage', 'temperature', 0) }}
    union all
    {{ map_measurement('triage', 'heartrate', 0) }}
    union all
    {{ map_measurement('triage', 'resprate', 0) }}
    union all
    {{ map_measurement('triage', 'o2sat', 0) }}
    union all
    {{ map_measurement('triage', 'sbp', 0) }}
    union all
    {{ map_measurement('triage', 'dbp', 0) }}
    union all
    {{ map_measurement('triage', 'pain', 0) }}

    union all

    {{ map_measurement('vitalsign', 'temperature', 0) }}
    union all
    {{ map_measurement('vitalsign', 'heartrate', 0) }}
    union all
    {{ map_measurement('vitalsign', 'resprate', 0) }}
    union all
    {{ map_measurement('vitalsign', 'o2sat', 0) }}
    union all
    {{ map_measurement('vitalsign', 'sbp', 0) }}
    union all
    {{ map_measurement('vitalsign', 'dbp', 0) }}
    union all
    {{ map_measurement('vitalsign', 'pain', 0) }}
    union all
    {{ map_measurement('vitalsign', 'rhythm', 0) }}
)

select * from measurement
