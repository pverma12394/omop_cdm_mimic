{{ config(
    schema='_harmonised'
) }}

with svs_metadata as (
    select * from
    {{
        source('raw_wsi_metadata', 'svs_metadata')
    }}
),

image_occurrence as (
    select
        md5(concat(row_number() over(), svs_metadata.svs_id::text, svs_metadata.file_name)) as image_occurrence_id,
        svs_metadata.svs_id as image_id,

        NULL as person_id,
        NULL as study_id,
        NULL as modality,
        NULL as body_part_examined,
        
        to_date(svs_metadata.aperio_date, 'MM/DD/YYYY') as date_of_image,
        
        svs_metadata.file_name as file_name
    from
        svs_metadata
)

select * from image_occurrence