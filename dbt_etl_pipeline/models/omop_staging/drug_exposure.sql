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

drug_exposure as (

    -- Select from medrecon
    select 
        NULL as drug_exposure_id,
        medrecon.subject_id as person_id,
        0 as drug_concept_id,
        date(medrecon.charttime) as drug_exposure_start_date,
        medrecon.charttime as drug_exposure_start_datetime,
        NULL as drug_exposure_end_date,
        NULL as drug_exposure_end_datetime,
        NULL as verbatim_end_date,
        32830 as drug_type_concept_id,
        NULL as stop_reason,
        NULL as refills,
        NULL as quantity,
        NULL as days_supply,
        NULL as sig,
        NULL as route_concept_id,
        NULL as lot_number,
        NULL as provider_id,
        medrecon.stay_id as visit_occurrence_id,
        NULL as visit_detail_id,
        medrecon.name as drug_source_value,
        medrecon.gsn as drug_source_concept_id,
        NULL as route_source_value,
        NULL as dose_unit_source_value

    from medrecon

    union all

    -- Select from pyxis
    select 
        NULL as drug_exposure_id,
        pyxis.subject_id as person_id,
        0 as drug_concept_id,
        date(pyxis.charttime) as drug_exposure_start_date,
        pyxis.charttime as drug_exposure_start_datetime,
        NULL as drug_exposure_end_date,
        NULL as drug_exposure_end_datetime,
        NULL as verbatim_end_date,
        32825 as drug_type_concept_id,
        NULL as stop_reason,
        NULL as refills,
        NULL as quantity,
        NULL as days_supply,
        NULL as sig,
        NULL as route_concept_id,
        NULL as lot_number,
        NULL as provider_id,
        pyxis.stay_id as visit_occurrence_id,
        NULL as visit_detail_id,
        pyxis.name as drug_source_value,
        pyxis.gsn as drug_source_concept_id,
        NULL as route_source_value,
        NULL as dose_unit_source_value

    from pyxis
)

select * from drug_exposure
