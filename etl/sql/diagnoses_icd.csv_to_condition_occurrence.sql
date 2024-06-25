
INSERT INTO condition_occurrence
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
    diagnoses_icd.csv.seq_num AS condition_occurrence_id,

    diagnoses_icd.csv.subject_id AS person_id,

-- [MAPPING LOGIC] SOURCE_TO_STANDARD.sql
-- [MAPPING COMMENTS] Map source id to standard concept id. Target vocab = 'SNOMED'
    diagnoses_icd.csv.icd_code AS condition_concept_id,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS condition_start_date,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS condition_start_datetime,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS condition_end_date,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS condition_end_datetime,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS condition_type_concept_id,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS condition_status_concept_id,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS stop_reason,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS provider_id,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS visit_occurrence_id,

    diagnoses_icd.csv.hadm_id AS visit_detail_id,

-- [MAPPING COMMENT] Get mapped value to source concept ID 
    diagnoses_icd.csv.icd_code AS condition_source_value,

 -- [MAPPING   LOGIC] SOURCE_TO_SOURCE.sql 
 -- [MAPPING COMMENT] Map source id to source concept id
    diagnoses_icd.csv.icd_code AS condition_source_concept_id,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS condition_status_source_value

FROM diagnoses_icd.csv
;