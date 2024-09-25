{{ config(
    schema='_harmonised'
) }}

with diagnosis as (
    select * from
     {{
        source('mimic_iv_ed', 'diagnosis')
     }}
),

condition_occurrence as (
    select 
        NULL as condition_occurrence_id,
        diagnosis.subject_id as person_id,
        0 as condition_concept_id,
        NULL as condition_start_date,
        NULL as condition_start_datetime,
        NULL as condition_end_date,
        NULL as condition_end_datetime,
        0 as condition_type_concept_id,
        0 as condition_status_concept_id,
        NULL as stop_reason,
        NULL as provider_id,
        diagnosis.stay_id as visit_occurrence_id,
        NULL as visit_detail_id,
        diagnosis.icd_title as condition_source_value,
        diagnosis.icd_code as condition_source_concept_id,
        NULL as condition_status_source_value
    from 
        diagnosis
)

select * from condition_occurrence
