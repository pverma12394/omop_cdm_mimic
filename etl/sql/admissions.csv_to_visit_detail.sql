
INSERT INTO ohdsi_demo.visit_detail
(
    visit_detail_id,
    person_id,
    visit_detail_concept_id,
    visit_detail_start_date,
    visit_detail_start_datetime,
    visit_detail_end_date,
    visit_detail_end_datetime,
    visit_detail_type_concept_id,
    provider_id,
    care_site_id,
    visit_detail_source_value,
    visit_detail_source_concept_id,
    admitted_from_concept_id,
    admitted_from_source_value,
    discharged_to_source_value,
    discharged_to_concept_id,
    preceding_visit_detail_id,
    parent_visit_detail_id,
    visit_occurrence_id
)
SELECT
    a.hadm_id AS visit_detail_id,
    a.subject_id AS person_id,
    a.admission_type AS visit_detail_concept_id,
    date(a.admittime) AS visit_detail_start_date,
    a.admittime AS visit_detail_start_datetime,
    date(a.dischtime) AS visit_detail_end_date,
    a.dischtime AS visit_detail_end_datetime,
    NULL AS visit_detail_type_concept_id,
    NULL AS provider_id,
    NULL AS care_site_id,
    a.admission_type AS visit_detail_source_value,
    NULL AS visit_detail_source_concept_id,
	0 AS admitted_from_concept_id,
    a.admission_location AS admitted_from_source_value,
    a.discharge_location AS discharged_to_source_value,
	0 AS discharged_to_concept_id,
    NULL AS preceding_visit_detail_id,
    NULL AS parent_visit_detail_id,
    NULL AS visit_occurrence_id

FROM mimic_source.admissions a
;