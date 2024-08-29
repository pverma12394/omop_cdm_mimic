## Table name: condition_occurrence

### Reading from diagnoses_icd.csv

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| condition_occurrence_id | seq_num |  |  |
| person_id | subject_id |  |  |
| condition_concept_id | icd_code | SOURCE_TO_STANDARD.sql | Map source id to standard concept id. Target vocab = 'SNOMED' |
| condition_start_date |  |  |  |
| condition_start_datetime |  |  |  |
| condition_end_date |  |  |  |
| condition_end_datetime |  |  |  |
| condition_type_concept_id |  |  |  |
| condition_status_concept_id |  |  |  |
| stop_reason |  |  |  |
| provider_id |  |  |  |
| visit_occurrence_id |  |  |  |
| visit_detail_id | hadm_id |  |  |
| condition_source_value | icd_code |  | Get mapped value to source concept ID |
| condition_source_concept_id | icd_code | SOURCE_TO_SOURCE.sql | Map source id to source concept id |
| condition_status_source_value |  |  |  |

