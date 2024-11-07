{{ config(
    schema='_harmonised'
) }}

with svs_metadata as (
    select * from
    {{
        source('raw_wsi_metadata', 'svs_metadata')
    }}
),

dataset_metadata as (
    select * from
    {{
        source('raw_wsi_metadata', 'dataset_metadata')
    }}
)

, person as (
    select
        concat('100', svs_metadata.svs_id::text) as person_id,

        NULL as gender_concept_id,
        NULL as gender_source_value,
        
        CAST(SUBSTRING(dataset_metadata.mock_sample_time, 1, 4) AS INT) - dataset_metadata.mock_patient_age::INT as year_of_birth,
        
        NULL as month_of_birth,
        NULL as day_of_birth,
        NULL as birth_datetime,
        NULL as race_concept_id,
        NULL as race_source_value,
        NULL as ethnicity_concept_id,
        NULL as ethnicity_source_value,
        NULL as location_id,
        NULL as provider_id,
        case 
            when dataset_metadata.mock_location = 'Hospital A' then 101
            when dataset_metadata.mock_location = 'Hospital B' then 102
            when dataset_metadata.mock_location = 'Hospital C' then 103
            else NULL
        end as care_site_id,

        NULL as person_source_value

    from svs_metadata
    join dataset_metadata on svs_metadata.file_name = dataset_metadata.svs_file_name
)

select * from person
