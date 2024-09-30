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

source_to_concept_map as (
    select * from
        {{
            source('mimic_iv_ed', 'source_to_concept_map')
        }}
),

measurement as (
    {{ map_measurement('triage', 'temperature', 4302666, 'source_to_concept_map') }}
    union all
    {{ map_measurement('triage', 'heartrate', 4239408, 'source_to_concept_map') }}
    union all
    {{ map_measurement('triage', 'resprate', 4313591, 'source_to_concept_map') }}
    union all
    {{ map_measurement('triage', 'o2sat', 40483579, 'source_to_concept_map') }}
    union all
    {{ map_measurement('triage', 'sbp', 4152194, 'source_to_concept_map') }}
    union all
    {{ map_measurement('triage', 'dbp', 4154790, 'source_to_concept_map') }}
    union all
    {{ map_measurement('triage', 'pain', 4022240, 'source_to_concept_map') }}

    union all

    {{ map_measurement('vitalsign', 'temperature', 4302666, 'source_to_concept_map') }}
    union all
    {{ map_measurement('vitalsign', 'heartrate', 4239408, 'source_to_concept_map') }}
    union all
    {{ map_measurement('vitalsign', 'resprate', 4313591, 'source_to_concept_map') }}
    union all
    {{ map_measurement('vitalsign', 'o2sat', 40483579, 'source_to_concept_map') }}
    union all
    {{ map_measurement('vitalsign', 'sbp', 4152194, 'source_to_concept_map') }}
    union all
    {{ map_measurement('vitalsign', 'dbp', 4154790, 'source_to_concept_map') }}
    union all
    {{ map_measurement('vitalsign', 'pain', 4022240, 'source_to_concept_map') }}
    union all
    {{ map_measurement('vitalsign', 'rhythm', 0, 'source_to_concept_map') }}
)

select * from measurement
