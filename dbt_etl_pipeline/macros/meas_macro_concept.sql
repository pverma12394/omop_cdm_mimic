{% macro map_triage_measurement(vital_column, concept_id) %}
    select
        NULL as measurement_id,
        triage.subject_id as person_id,
        {{ concept_id }} as measurement_concept_id,
        NULL as measurement_date,  
        NULL as measurement_datetime,  
        NULL as measurement_time,  
        0 as measurement_type_concept_id, 
        NULL as operator_concept_id,  
        NULL as value_as_number,
        0 as value_as_concept_id, 
        NULL as unit_concept_id,  
        NULL as range_low, 
        NULL as range_high,  
        NULL as provider_id,
        triage.stay_id as visit_occurrence_id,
        NULL as visit_detail_id,  
        triage.{{ vital_column }} as measurement_source_value,
        0 as measurement_source_concept_id,
        NULL as unit_source_value,
        NULL as unit_source_concept_id,
        triage.chiefcomplaint as value_source_value,
        triage.acuity as acuity_source_value, -- Custom OMOP field
        NULL as measurement_event_id,
        NULL as meas_event_field_concept_id
    from 
        triage
{% endmacro %}

{% macro map_vitalsign_measurement(vital_column, concept_id) %}
    select
        NULL as measurement_id,
        vitalsign.subject_id as person_id,
        {{ concept_id }} as measurement_concept_id,
        CAST(date(vitalsign.charttime) AS TEXT) as measurement_date, 
        CAST(vitalsign.charttime AS TEXT) as measurement_datetime,
        CASE 
            WHEN EXTRACT(HOUR FROM vitalsign.charttime) IS NOT NULL THEN 
                LPAD(CAST(EXTRACT(HOUR FROM vitalsign.charttime) AS TEXT), 2, '0') || ':' ||
                LPAD(CAST(EXTRACT(MINUTE FROM vitalsign.charttime) AS TEXT), 2, '0') || ':' ||
                LPAD(CAST(EXTRACT(SECOND FROM vitalsign.charttime) AS TEXT), 2, '0')
            ELSE '00:00:00'
        END as measurement_time,
        0 as measurement_type_concept_id,
        NULL as operator_concept_id,
        NULL as value_as_number,
        0 as value_as_concept_id,
        NULL as unit_concept_id,
        NULL as range_low,
        NULL as range_high,
        NULL as provider_id,
        vitalsign.stay_id as visit_occurrence_id,
        NULL as visit_detail_id,
        vitalsign.{{ vital_column }} as measurement_source_value,
        0 as measurement_source_concept_id,
        NULL as unit_source_value,
        NULL as unit_source_concept_id,
        NULL as value_source_value,
        NULL as acuity_source_value, -- Custom OMOP field
        NULL as measurement_event_id,
        NULL as meas_event_field_concept_id
    from 
        vitalsign
{% endmacro %}