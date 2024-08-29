
INSERT INTO ohdsi_demo.condition_occurrence
(
    condition_occurrence_id,
    person_id,
    condition_concept_id,
    condition_start_date,
    condition_start_datetime,
    condition_end_date,
    condition_end_datetime,
    condition_type_concept_id,
    condition_status_concept_id,
    stop_reason,
    provider_id,
    visit_occurrence_id,
    visit_detail_id,
    condition_source_value,
    condition_source_concept_id,
    condition_status_source_value
)
SELECT
    diagnoses_icd.seq_num AS condition_occurrence_id,
    diagnoses_icd.subject_id AS person_id,
    diagnoses_icd.icd_code AS condition_concept_id,

    NULL AS condition_start_date,
    NULL AS condition_start_datetime,
    NULL AS condition_end_date,
    NULL AS condition_end_datetime,
    NULL AS condition_type_concept_id,
    NULL AS condition_status_concept_id,
    NULL AS stop_reason,
    NULL AS provider_id,
    NULL AS visit_occurrence_id,

    diagnoses_icd.hadm_id AS visit_detail_id,
    diagnoses_icd.csv.icd_code AS condition_source_value,
    diagnoses_icd.icd_code AS condition_source_concept_id,
    NULL AS condition_status_source_value

FROM mimic_source.diagnoses_icd
;