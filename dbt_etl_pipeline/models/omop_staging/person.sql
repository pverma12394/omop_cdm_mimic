{{ config(
    schema='_harmonised'
) }}

with edstays as (
    select *
    from {{ source('mimic_iv_ed', 'edstays') }}
),

source_to_concept_map as (
    select *
    from {{ source('mimic_iv_ed', 'source_to_concept_map') }}
),

person as (
    select 
        edstays.subject_id as person_id,
        coalesce(stcm_gender.target_concept_id, 0) as gender_concept_id,
        NULL as year_of_birth,
        NULL AS month_of_birth,
        NULL AS day_of_birth,
        NULL AS birth_datetime,
        coalesce(stcm_race.target_concept_id, 0) AS race_concept_id,
        0 AS ethnicity_concept_id,
        NULL AS location_id,
        NULL AS provider_id,
        NULL AS care_site_id,
        NULL AS person_source_value,
        edstays.gender as gender_source_value,
        NULL AS gender_source_concept_id,
        edstays.race AS race_source_value,
        NULL AS race_source_concept_id,
        NULL AS ethnicity_source_value,
        NULL AS ethnicity_source_concept_id
    FROM edstays
    left join source_to_concept_map stcm_gender
        on lower(edstays.gender) = lower(stcm_gender.source_code_description)
    left join source_to_concept_map stcm_race
        on lower(edstays.race) = lower(stcm_race.source_code_description)
)

select * from person
