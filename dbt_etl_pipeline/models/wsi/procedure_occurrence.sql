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

, procedure_occurrence as (
    select 
        md5(concat(row_number() over(), dataset_metadata.svs_file_name::text, dataset_metadata.block_id::text)) as procedure_occurrence_id,

        concat('100', svs_metadata.svs_id::text) as person_id,
        case 
            when lower(dataset_metadata.procedure_type) = 'resection' then 45882769
            when lower(dataset_metadata.procedure_type) = 'biopsy' then 45882770
        else 0 
        end as procedure_concept_id,
        NULL as procedure_date,
        NULL as procedure_datetime,
        NULL as procedure_end_date,
        NULL as procedure_end_datetime,
        40769814 as procedure_type_concept_id,
        case 
            when lower(dataset_metadata.stain_type) = 'h&e' then 4014506
            when lower(dataset_metadata.stain_type) = 'ihc' then 4035726
        else 0 
        end as modifier_concept_id,
        NULL as quantity,
        NULL as provider_id,
        NULL as visit_occurrence_id,
        svs_metadata.svs_id as visit_detail_id,
        dataset_metadata.procedure_type as procedure_source_value,
        replace(dataset_metadata.stain_type, '&', 'n') as modifier_source_value

    from svs_metadata
    join dataset_metadata on svs_metadata.file_name = dataset_metadata.svs_file_name
)

select * from procedure_occurrence