INSERT INTO ohdsi_demo.measurement
(
    measurement_id,
    person_id,
    measurement_concept_id,
    measurement_date,
    measurement_datetime,
    measurement_time,
    measurement_type_concept_id,
    operator_concept_id,
    value_as_number,
    value_as_concept_id,
    unit_concept_id,
    range_low,
    range_high,
    provider_id,
    visit_occurrence_id,
    visit_detail_id,
    measurement_source_value,
    measurement_source_concept_id,
    unit_source_value,
    unit_source_concept_id,
    value_source_value,
    measurement_event_id,
    meas_event_field_concept_id
)
SELECT
    labevents.labevent_id AS measurement_id,
    labevents.subject_id AS person_id,
    0 AS measurement_concept_id,
    date(labevents.storetime) AS measurement_date,
    labevents.storetime::timestamp AS measurement_datetime,
    labevents.storetime::time AS measurement_time,
    0 AS measurement_type_concept_id,
    0 AS operator_concept_id,
    labevents.valuenum AS value_as_number,
    0 AS value_as_concept_id,
    0 AS unit_concept_id,
    labevents.ref_range_lower AS range_low,
    labevents.ref_range_upper AS range_high,
    labevents.order_provider_id AS provider_id,
    labevents.hadm_id AS visit_occurrence_id,
    NULL AS visit_detail_id,
    NULL AS measurement_source_value,
    0 AS measurement_source_concept_id,
    labevents.valueuom AS unit_source_value,
    0 AS unit_source_concept_id,
    labevents.value AS value_source_value,
    NULL AS measurement_event_id,
    0 AS meas_event_field_concept_id
    
FROM mimic_source.labevents
;


