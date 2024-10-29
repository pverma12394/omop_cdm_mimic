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

unpacked_features as (
    select
        -- Unique identifier for the image feature
        md5(concat(row_number() over(), svs_metadata.svs_id::text, dim_name)) as image_feature_id,
        
        -- Unique identifier for each image
        svs_metadata.svs_id as image_id,

        -- Define feature type for each dimension and additional feature
        case 
            -- Dimension features
            when dim_name like '%tile_width%' then 'Tile width'
            when dim_name like '%tile_height%' then 'Tile height'
            when dim_name like '%width%' and dim_name not like '%stripewidth%' then 'Image width'
            when dim_name like '%height%' then 'Image height'
            when dim_name like '%downsample%' then 'Downsample level'

            -- Additional features with specific labels
            when dim_name = 'aperio_top' then 'Top edge position'
            when dim_name = 'aperio_left' then 'Left edge position'
            when dim_name = 'aperio_mpp' then 'Micrometers per pixel'
            when dim_name = 'openslide_mpp_x' then 'X-dimension micrometers per pixel'
            when dim_name = 'openslide_mpp_y' then 'Y-dimension micrometers per pixel'
            when dim_name = 'aperio_appmag' then 'Apparent magnification'
            
            when dim_name = 'aperio_sessionmode' then 'Session mode'
            when dim_name = 'aperio_calibrationaveragegreen' then 'Green channel calibration'
            when dim_name = 'aperio_calibrationaverageblue' then 'Blue channel calibration'
            when dim_name = 'aperio_calibrationaveragered' then 'Red channel calibration'
            when dim_name = 'aperio_gamma' then 'Gamma correction'
            when dim_name = 'aperio_slide' then 'Slide identifier'
            when dim_name = 'aperio_rack' then 'Rack identifier'
            when dim_name = 'aperio_filtered' then 'Filtered status'
            when dim_name = 'aperio_stripewidth' then 'Stripe width'
            when dim_name = 'aperio_exposure_scale' then 'Exposure Scale'
            when dim_name = 'aperio_focus_offset' then 'Focus Offset'
            when dim_name = 'openslide_objective_power' then 'Objective Power'
            when dim_name = 'aperio_scan_warning' then 'Warning'
            
            else NULL
        end as feature_type,

        -- Dynamic mapping for each level’s column with NULL checks
        case 
            when dim_name = 'openslide_level_0_tile_width' then NULLIF(svs_metadata.openslide_level_0_tile_width::text, '')
            when dim_name = 'openslide_level_1_tile_width' then NULLIF(svs_metadata.openslide_level_1_tile_width::text, '')
            when dim_name = 'openslide_level_2_tile_width' then NULLIF(svs_metadata.openslide_level_2_tile_width::text, '')
            when dim_name = 'openslide_level_3_tile_width' then NULLIF(svs_metadata.openslide_level_3_tile_width::text, '')

            when dim_name = 'openslide_level_0_tile_height' then NULLIF(svs_metadata.openslide_level_0_tile_height::text, '')
            when dim_name = 'openslide_level_1_tile_height' then NULLIF(svs_metadata.openslide_level_1_tile_height::text, '')
            when dim_name = 'openslide_level_2_tile_height' then NULLIF(svs_metadata.openslide_level_2_tile_height::text, '')
            when dim_name = 'openslide_level_3_tile_height' then NULLIF(svs_metadata.openslide_level_3_tile_height::text, '')

            when dim_name = 'openslide_level_0_width' then NULLIF(svs_metadata.openslide_level_0_width::text, '')
            when dim_name = 'openslide_level_1_width' then NULLIF(svs_metadata.openslide_level_1_width::text, '')
            when dim_name = 'openslide_level_2_width' then NULLIF(svs_metadata.openslide_level_2_width::text, '')
            when dim_name = 'openslide_level_3_width' then NULLIF(svs_metadata.openslide_level_3_width::text, '')

            when dim_name = 'openslide_level_0_height' then NULLIF(svs_metadata.openslide_level_0_height::text, '')
            when dim_name = 'openslide_level_1_height' then NULLIF(svs_metadata.openslide_level_1_height::text, '')
            when dim_name = 'openslide_level_2_height' then NULLIF(svs_metadata.openslide_level_2_height::text, '')
            when dim_name = 'openslide_level_3_height' then NULLIF(svs_metadata.openslide_level_3_height::text, '')

            when dim_name = 'openslide_level_0_downsample' then NULLIF(svs_metadata.openslide_level_0_downsample::text, '')
            when dim_name = 'openslide_level_1_downsample' then NULLIF(svs_metadata.openslide_level_1_downsample::text, '')
            when dim_name = 'openslide_level_2_downsample' then NULLIF(svs_metadata.openslide_level_2_downsample::text, '')
            when dim_name = 'openslide_level_3_downsample' then NULLIF(svs_metadata.openslide_level_3_downsample::text, '')
            
            -- Additional features with direct mapping
            when dim_name = 'aperio_top' then NULLIF(svs_metadata.aperio_top::text, '')
            when dim_name = 'aperio_left' then NULLIF(svs_metadata.aperio_left::text, '')
            when dim_name = 'aperio_mpp' then NULLIF(svs_metadata.aperio_mpp::text, '')
            when dim_name = 'openslide_mpp_x' then NULLIF(svs_metadata.openslide_mpp_x::text, '')
            when dim_name = 'openslide_mpp_y' then NULLIF(svs_metadata.openslide_mpp_y::text, '')
            when dim_name = 'aperio_appmag' then NULLIF(svs_metadata.aperio_appmag::text, '')
            when dim_name = 'aperio_sessionmode' then NULLIF(svs_metadata.aperio_sessionmode::text, '')
            when dim_name = 'aperio_calibrationaveragegreen' then NULLIF(svs_metadata.aperio_calibrationaveragegreen::text, '')
            when dim_name = 'aperio_calibrationaverageblue' then NULLIF(svs_metadata.aperio_calibrationaverageblue::text, '')
            when dim_name = 'aperio_calibrationaveragered' then NULLIF(svs_metadata.aperio_calibrationaveragered::text, '')
            when dim_name = 'aperio_gamma' then NULLIF(svs_metadata.aperio_gamma::text, '')
            when dim_name = 'aperio_slide' then NULLIF(svs_metadata.aperio_slide::text, '')
            when dim_name = 'aperio_rack' then NULLIF(svs_metadata.aperio_rack::text, '')
            when dim_name = 'aperio_filtered' then NULLIF(svs_metadata.aperio_filtered::text, '')
            when dim_name = 'aperio_stripewidth' then NULLIF(svs_metadata.aperio_stripewidth::text, '')
            when dim_name = 'aperio_exposure_scale' then NULLIF(svs_metadata.aperio_exposure_scale::text, '')
            when dim_name = 'aperio_focus_offset' then NULLIF(svs_metadata.aperio_focus_offset::text, '')
            when dim_name = 'openslide_objective_power' then NULLIF(svs_metadata.openslide_objective_power::text, '')
            when dim_name = 'aperio_scan_warning' then NULLIF(svs_metadata.aperio_scan_warning::text, '')

            else NULL
        end as feature_source_value,

        -- Downsample level dynamically assigned based on level in column name
        case 
            when dim_name like '%level_0%' then 0
            when dim_name like '%level_1%' then 1
            when dim_name like '%level_2%' then 2
            when dim_name like '%level_3%' then 3
            else NULL
        end as downsample_level,

        -- Concept IDs and unit values
        0 as feature_source_concept_id,

        case
            when dim_name like '%tile_width%' then NULLIF(svs_metadata.tiff_resolutionunit::text, '')
            when dim_name like '%tile_height%' then NULLIF(svs_metadata.tiff_resolutionunit::text, '')
            when dim_name like '%width%' then NULLIF(svs_metadata.tiff_resolutionunit::text, '')
            when dim_name like '%height%' then NULLIF(svs_metadata.tiff_resolutionunit::text, '')
        end as unit_source_value,

        -- Extraction metadata
        to_char(to_date(svs_metadata.aperio_date, 'MM/DD/YYYY'), 'YYYY-MM-DD') as extraction_date,
        svs_metadata.aperio_time as extraction_time,
        to_char(to_date(svs_metadata.aperio_date, 'MM/DD/YYYY'), 'YYYY-MM-DD') || ' ' || svs_metadata.aperio_time as extraction_datetime,
        svs_metadata.aperio_time_zone as extraction_timezone,
        
        -- Description
        svs_metadata.openslide_comment as description
    from
        svs_metadata,
        unnest(
            
            array[
                'openslide_level_0_tile_width', 'openslide_level_1_tile_width', 'openslide_level_2_tile_width', 'openslide_level_3_tile_width',
                'openslide_level_0_tile_height', 'openslide_level_1_tile_height', 'openslide_level_2_tile_height', 'openslide_level_3_tile_height',
                'openslide_level_0_width', 'openslide_level_1_width', 'openslide_level_2_width', 'openslide_level_3_width',
                'openslide_level_0_height', 'openslide_level_1_height', 'openslide_level_2_height', 'openslide_level_3_height',
                'openslide_level_0_downsample', 'openslide_level_1_downsample', 'openslide_level_2_downsample', 'openslide_level_3_downsample',
                'aperio_top', 'aperio_left', 'aperio_mpp', 'openslide_mpp_x', 'openslide_mpp_y', 'aperio_appmag', 'aperio_sessionmode',
                'aperio_calibrationaveragegreen', 'aperio_calibrationaverageblue', 'aperio_calibrationaveragered', 'aperio_gamma',
                'aperio_slide', 'aperio_rack', 'aperio_filtered', 'aperio_stripewidth', 'aperio_exposure_scale', 'aperio_focus_offset', 'openslide_objective_power',
                'aperio_scan_warning'
            ],
            array[
                'tile_width', 'tile_width', 'tile_width', 'tile_width',
                'tile_height', 'tile_height', 'tile_height', 'tile_height',
                'width', 'width', 'width', 'width',
                'height', 'height', 'height', 'height',
                'downsample', 'downsample', 'downsample', 'downsample',
                'aperio_top', 'aperio_left', 'aperio_mpp', 'openslide_mpp_x', 'openslide_mpp_y', 'aperio_appmag', 'aperio_sessionmode',
                'aperio_calibrationaveragegreen', 'aperio_calibrationaverageblue', 'aperio_calibrationaveragered', 'aperio_gamma',
                'aperio_slide', 'aperio_rack', 'aperio_filtered', 'aperio_stripewidth', 'aperio_exposure_scale', 'aperio_focus_offset', 'openslide_objective_power',
                'aperio_scan_warning'
            ]
        ) as t(dim_name, dimension_name)
),

mapped_features as (
    select 
        u.*,
        stcm_feature.target_concept_id as feature_concept_id,
        stcm_unit.target_concept_id as unit_concept_id
    from 
        unpacked_features u
    left join 
        source_to_concept_map stcm_feature 
    on 
        u.feature_type = stcm_feature.source_code_description

    left join 
        source_to_concept_map stcm_unit 
    on u.feature_type in ('Image width', 'Image height', 'Tile width', 'Tile height')
    and stcm_unit.source_code_description = u.unit_source_value
)

select * from mapped_features
