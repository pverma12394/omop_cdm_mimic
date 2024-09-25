{{ config(
    schema='_harmonised'
) }}

with patients as (
    select *
    from {{ source('mimic_iv_ed', 'patients') }}
),

person as (
    select 
        patients.subject_id as person_id,
        case upper(patients.gender)
            when 'M' then 8507
            when 'F' then 8532
            else null -- Handle unexpected gender values
        end as gender_concept_id,
        patients.anchor_year as year_of_birth,
        NULL AS month_of_birth,
        NULL AS day_of_birth,
        NULL AS birth_datetime,
        0 AS race_concept_id,  -- Assuming default value for race
        0 AS ethnicity_concept_id,  -- Assuming default value for ethnicity
        NULL AS location_id,
        NULL AS provider_id,
        NULL AS care_site_id,
        NULL AS person_source_value,
        patients.gender as gender_source_value,
        NULL AS gender_source_concept_id,
        NULL AS race_source_value,
        NULL AS race_source_concept_id,
        NULL AS ethnicity_source_value,
        NULL AS ethnicity_source_concept_id
    FROM patients
)

select * from person
