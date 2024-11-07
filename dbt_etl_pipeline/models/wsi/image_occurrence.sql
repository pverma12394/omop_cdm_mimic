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

, image_occurrence as (
    select
        md5(concat(row_number() over(), svs_metadata.svs_id::text, svs_metadata.file_name)) as image_occurrence_id,
        svs_metadata.svs_id as visit_detail_id,

        concat('100', svs_metadata.svs_id::text) as person_id,
        dataset_metadata.block_id as study_id,
        NULL as modality,
        
        dataset_metadata.tissue_type as body_part_examined,
        
        to_date(svs_metadata.aperio_date, 'MM/DD/YYYY') as date_of_image,
        
        svs_metadata.file_name as file_name
    from
        svs_metadata
    join
        dataset_metadata on svs_metadata.file_name = dataset_metadata.svs_file_name
)

select * from image_occurrence
