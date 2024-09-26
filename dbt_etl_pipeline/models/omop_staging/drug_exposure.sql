{{ config(
    schema='_harmonised'
) }}

with medrecon as (
    select * from
     {{
        source('mimic_iv_ed', 'medrecon')
     }}
),

pyxis as (
    select * from
     {{
        source('mimic_iv_ed', 'pyxis')
     }}
),

source_to_concept_map as (
    select * from
     {{
        source('mimic_iv_ed', 'source_to_concept_map')
     }}
),

combined_data as (
    -- Combine both medrecon and pyxis with a source identifier
    select 
        'medrecon' as source,
        medrecon.subject_id as person_id,
        coalesce(stcm.target_concept_id, 0) as drug_concept_id,
        date(medrecon.charttime) as drug_exposure_start_date,
        medrecon.charttime as drug_exposure_start_datetime,
        NULL as drug_exposure_end_date,
        NULL as drug_exposure_end_datetime,
        NULL as verbatim_end_date,
        32830 as drug_type_concept_id,
        medrecon.stay_id as visit_occurrence_id,
        medrecon.name as drug_source_value,
        medrecon.gsn as drug_source_concept_id
    from medrecon
    left join source_to_concept_map stcm 
        on medrecon.gsn = stcm.source_code::INTEGER

    union all

    select 
        'pyxis' as source,
        pyxis.subject_id as person_id,
        coalesce(stcm.target_concept_id, 0) as drug_concept_id,
        date(pyxis.charttime) as drug_exposure_start_date,
        pyxis.charttime as drug_exposure_start_datetime,
        NULL as drug_exposure_end_date,
        NULL as drug_exposure_end_datetime,
        NULL as verbatim_end_date,
        32825 as drug_type_concept_id,
        pyxis.stay_id as visit_occurrence_id,
        pyxis.name as drug_source_value,
        pyxis.gsn as drug_source_concept_id
    from pyxis
    left join source_to_concept_map stcm 
        on pyxis.gsn = stcm.source_code::INTEGER
),

-- Generate unique IDs based on row number and total row count from combined data
drug_exposure as (
    select 
        ROW_NUMBER() OVER (ORDER BY source, person_id) + 100000 as drug_exposure_id,
        person_id,
        drug_concept_id,
        drug_exposure_start_date,
        drug_exposure_start_datetime,
        drug_exposure_end_date,
        drug_exposure_end_datetime,
        verbatim_end_date,
        drug_type_concept_id,
        visit_occurrence_id,
        drug_source_value,
        drug_source_concept_id
    from combined_data
)

select * from drug_exposure
