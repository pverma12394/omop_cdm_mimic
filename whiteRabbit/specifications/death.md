## Table name: death

### Reading from patients.csv

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| person_id | subject_id |  |  |
| death_date | dod | DATETIME to DATE |  |
| death_datetime | dod |  |  |
| death_type_concept_id |  |  |  |
| cause_concept_id |  |  |  |
| cause_source_value |  |  |  |
| cause_source_concept_id |  |  |  |

### Reading from admissions.csv

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| person_id | subject_id |  |  |
| death_date | deathtime | DATETIME to DATE |  |
| death_datetime | deathtime |  |  |
| death_type_concept_id |  |  |  |
| cause_concept_id |  |  |  |
| cause_source_value |  |  |  |
| cause_source_concept_id |  |  |  |

