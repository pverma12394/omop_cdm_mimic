## Table name: visit_occurrence

### Reading from icustays.csv

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| visit_occurrence_id |  |  |  |
| person_id | subject_id |  |  |
| visit_concept_id |  |  |  |
| visit_start_date | intime | DATETIME to DATE |  |
| visit_start_datetime | intime |  |  |
| visit_end_date | outtime | DATETIME to DATE |  |
| visit_end_datetime | outtime |  |  |
| visit_type_concept_id |  |  |  |
| provider_id |  |  |  |
| care_site_id | stay_id |  |  |
| visit_source_value |  |  |  |
| visit_source_concept_id |  |  |  |
| admitted_from_concept_id |  |  |  |
| admitted_from_source_value |  |  |  |
| discharged_to_concept_id |  |  |  |
| discharged_to_source_value |  |  |  |
| preceding_visit_occurrence_id |  |  |  |

