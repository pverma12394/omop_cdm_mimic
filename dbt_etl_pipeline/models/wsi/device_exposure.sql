{{ config(
    schema='_harmonised'
) }}

with svs_metadata as (
    select * from
    {{
        source('raw_wsi_metadata', 'svs_metadata')
    }}
),

source_to_concept_map as (
    select * from
    {{
        source('raw_wsi_metadata', 'source_to_concept_map')
    }}
),

device_exposure as (
    select
        -- Generate unique ID for device exposure records
        md5(concat(row_number() over(), svs_metadata.svs_id::text)) as device_exposure_id,
        
        -- Person and device information
        NULL as person_id,
        0 as device_concept_id,

        -- Format the start date in `YYYY-MM-DD`
        to_char(to_date(svs_metadata.aperio_date, 'MM/DD/YYYY'), 'YYYY-MM-DD') as device_exposure_start_date,

        -- Combine date and time as `datetime` without timezone
        to_timestamp(svs_metadata.aperio_date || ' ' || svs_metadata.aperio_time, 'MM/DD/YYYY HH24:MI:SS')::timestamp as device_exposure_start_datetime,

        -- Optional fields for device exposure
        0 as device_type_concept_id,
        svs_metadata.aperio_scanscope_id as unique_device_id,
        NULL as production_id,
        NULL as quantity,
        NULL as provider_id,
        NULL as visit_occurrence_id,
        svs_metadata.svs_id as visit_detail_id,
        split_part(svs_metadata.openslide_comment, '|', 1) as device_source_value,
        0 as device_source_concept_id,
        coalesce(stcm.target_concept_id, 0) as unit_concept_id,
        svs_metadata.tiff_resolutionunit as unit_source_value,
        0 as unit_source_concept_id

    from svs_metadata
    left join
        source_to_concept_map as stcm
    on 
        svs_metadata.tiff_resolutionunit = stcm.source_code_description
)

select * from device_exposure

