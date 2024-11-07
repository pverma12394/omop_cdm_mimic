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

, observation as (
    select 
        md5(concat(row_number() over(), dataset_metadata.svs_file_name::text, dataset_metadata.mock_artifact::text)) as observation_id,
        concat('100', svs_metadata.svs_id::text) as person_id,
        0 as observation_concept_id,
        NULL as observation_date,
        NULL as observation_datetime,
        NULL as observation_type_concept_id,
        NULL as value_as_number,
        dataset_metadata.mock_artifact as value_as_string,
        case 
            when dataset_metadata.mock_artifact is NULL or dataset_metadata.mock_artifact = 'None' then 0
            else 4167321
        end as value_as_concept_id,
        NULL as qualifier_concept_id,
        NULL as unit_concept_id,
        NULL as provider_id,
        NULL as visit_occurrence_id,
        svs_metadata.svs_id as visit_detail_id,
        dataset_metadata.mock_result as observation_source_value,
        0 as observation_source_concept_id,
        NULL as unit_source_value,
        NULL as qualifier_source_value,
        NULL as observation_event_id,
        NULL as obs_event_field_concept_id
    from svs_metadata
    join dataset_metadata on svs_metadata.file_name = dataset_metadata.svs_file_name
)

select * from observation