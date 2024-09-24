{{ config(
    schema='_harmonised'
) }}

with edstays as (
    select * from
     {{
        source('mimic_iv_ed', 'edstays')
     }}
),

visit_occurrence as (
    select 
        edstays.stay_id as visit_occurrence_id,
        edstays.subject_id as person_id,
        0 as visit_concept_id,
        date(edstays.intime) as visit_start_date,
        edstays.intime as visit_start_datetime,
        date(edstays.outtime) as visit_end_date,
        edstays.outtime as visit_end_datetime,
        NULL as visit_type_concept_id,
        NULL as provider_id,
        NULL as care_site_id,
        edstays.arrival_transport as visit_source_value,
        NULL as visit_source_concept_id,
        NULL as admitted_from_concept_id,
        NULL as admitted_from_source_value,
        0 as discharged_to_concept_id,
        edstays.disposition as discharged_to_source_value,
        NULL as preceding_visit_occurrence_id
    from
        edstays
)

select * from visit_occurrence
