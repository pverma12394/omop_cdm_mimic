## Table name: visit_detail

### Reading from admissions.csv

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| visit_detail_id | hadm_id |  |  |
| person_id | subject_id |  |  |
| visit_detail_concept_id | admission_type |  |  |
| visit_detail_start_date | admittime | DATETIME to DATE |  |
| visit_detail_start_datetime | admittime |  |  |
| visit_detail_end_date | dischtime | DATETIME to DATE |  |
| visit_detail_end_datetime | dischtime | DA |  |
| visit_detail_type_concept_id |  |  |  |
| provider_id |  |  |  |
| care_site_id |  |  |  |
| visit_detail_source_value | admission_type |  |  |
| visit_detail_source_concept_id |  |  |  |
| admitted_from_concept_id | admission_location |  |  |
| admitted_from_source_value | admission_location |  |  |
| discharged_to_source_value | discharge_location |  |  |
| discharged_to_concept_id | discharge_location |  |  |
| preceding_visit_detail_id |  |  |  |
| parent_visit_detail_id |  |  |  |
| visit_occurrence_id |  |  |  |

