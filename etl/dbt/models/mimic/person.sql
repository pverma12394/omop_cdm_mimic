with patients as (
    select * from
     {{
        source('omop_cdm', 'patients')
     }}
),

person as (
    select 
        patients.subject_id as person_id,
        patients.gender as gender_source_value,
        case upper(patients.gender)
            when 'M' then 8507
            when 'F' then 8532
        end as gender_concept_id,
        patients.anchor_year as year_of_birth,
        NULL as month_of_birth,
        NULL as day_of_birth,
        NULL as birth_datetime,
        NULL as race_concept_id,
        NULL as ethnicity_concept_id
    from
        patients
)

select * from person