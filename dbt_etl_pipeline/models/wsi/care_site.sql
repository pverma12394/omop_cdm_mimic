{{ config(
    schema='_harmonised'
) }}

with dataset_metadata as (
    select * from
    {{
        source('raw_wsi_metadata', 'dataset_metadata')
    }}
),

care_site as (
    select distinct
        case 
            when dataset_metadata.mock_location = 'Hospital A' then 101
            when dataset_metadata.mock_location = 'Hospital B' then 102
            when dataset_metadata.mock_location = 'Hospital C' then 103
            else NULL
        end as care_site_id,

        dataset_metadata.mock_location as care_site_name,
        NULL as place_of_service_concept_id,
        NULL as location_id,
        dataset_metadata.mock_location as care_site_source_value,
        NULL as place_of_service_source_value
    from dataset_metadata
)

select * from care_site