{{ config(
    schema='_harmonised'
) }}

with dataset_metadata as (
    select * from
    {{
        source('raw_wsi_metadata', 'dataset_metadata')
    }}
),

svs_metadata as (
    select * from
    {{
        source('raw_wsi_metadata', 'svs_metadata')
    }}
)

, condition_occurrence as (
    select 
        md5(concat(row_number() over(), dataset_metadata.svs_file_name::text)) as condition_occurrence_id,

        concat('100', svs_metadata.svs_id::text) as person_id,
        case
            when lower(dataset_metadata.disease_state) = 'liver cancer' then 4246127
            when lower(dataset_metadata.disease_state) = 'follicular lymphoma' then 1244961
            when lower(dataset_metadata.disease_state) = 'normal lung' then 37311178
            when lower(dataset_metadata.disease_state) = 'normal prostate' then 4115734
            when lower(dataset_metadata.disease_state) = 'thyroid cancer' then 37165558
            when lower(dataset_metadata.disease_state) = 'hepatocellular carcinoma' then 4101758
            when lower(dataset_metadata.disease_state) = 'brain cancer' then 373724
        else 0
        end as condition_concept_id,
        NULL as condition_start_date,
        NULL as condition_start_datetime,
        NULL as condition_end_date,
        NULL as condition_end_datetime,
        NULL as condition_type_concept_id,
        NULL as condition_status_concept_id,
        NULL as stop_reason,
        NULL as provider_id,
        NULL as visit_occurrence_id,
        svs_metadata.svs_id as visit_detail_id,
        dataset_metadata.disease_state as condition_source_value, 
        0 as condition_source_concept_id,
        NULL as condition_status_source_value
    from svs_metadata
    join dataset_metadata on svs_metadata.file_name = dataset_metadata.svs_file_name
)

select * from condition_occurrence