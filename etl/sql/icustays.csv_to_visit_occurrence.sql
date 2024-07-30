
INSERT INTO ohdsi_demo.visit_occurrence
(
    visit_occurrence_id,
    person_id,
    visit_concept_id,
    visit_start_date,
    visit_start_datetime,
    visit_end_date,
    visit_end_datetime,
    visit_type_concept_id,
    provider_id,
    care_site_id,
    visit_source_value,
    visit_source_concept_id,
    admitted_from_concept_id,
    admitted_from_source_value,
    discharged_to_concept_id,
    discharged_to_source_value,
    preceding_visit_occurrence_id
)
SELECT
    NULL AS visit_occurrence_id,

    icustays.subject_id AS person_id,
    NULL AS visit_concept_id,
    date(icustays.intime) AS visit_start_date,
    icustays.intime AS visit_start_datetime,
    date(icustays.outtime) AS visit_end_date,
    icustays.outtime AS visit_end_datetime,
    NULL AS visit_type_concept_id,
    NULL AS provider_id,
    icustays.stay_id AS care_site_id,
    NULL AS visit_source_value,
    NULL AS visit_source_concept_id,
    NULL AS admitted_from_concept_id,
    NULL AS admitted_from_source_value,
    NULL AS discharged_to_concept_id,
    NULL AS discharged_to_source_value,
    NULL AS preceding_visit_occurrence_id

FROM mimic_source.icustays
;