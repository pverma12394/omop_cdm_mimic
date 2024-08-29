## Table name: person

### Reading from patients.csv

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| person_id | subject_id |  |  |
| gender_concept_id | gender | M = 8507  F = 8532 | Since there is no concept ID for M and F which basically refers to MALE and FEMALE in the vocabulary, we will pass instructions to the developers to refer to the aforementioned concept ids to map MALE and FEMALE subjects<br> |
| year_of_birth | anchor_year |  |  |
| month_of_birth |  |  |  |
| day_of_birth |  |  |  |
| birth_datetime |  |  |  |
| race_concept_id |  |  |  |
| ethnicity_concept_id |  |  |  |
| location_id |  |  |  |
| provider_id |  |  |  |
| care_site_id |  |  |  |
| person_source_value |  |  |  |
| gender_source_value | gender |  |  |
| gender_source_concept_id | gender | 0 | There is no source concept Id that is available to represent gender in the source vocabulary |
| race_source_value |  |  |  |
| race_source_concept_id |  |  |  |
| ethnicity_source_value |  |  |  |
| ethnicity_source_concept_id |  |  |  |

### Reading from admissions.csv

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| person_id | subject_id |  |  |
| gender_concept_id |  |  |  |
| year_of_birth |  |  |  |
| month_of_birth |  |  |  |
| day_of_birth |  |  |  |
| birth_datetime |  |  |  |
| race_concept_id |  |  |  |
| ethnicity_concept_id | ethnicity | Hispanic = 38003563 | `SOURCE_TO_STANDARD.sql` |
| location_id |  |  |  |
| provider_id |  |  |  |
| care_site_id |  |  |  |
| person_source_value |  |  |  |
| gender_source_value |  |  |  |
| gender_source_concept_id |  |  |  |
| race_source_value |  |  |  |
| race_source_concept_id |  |  |  |
| ethnicity_source_value | ethnicity |  |  |
| ethnicity_source_concept_id | ethnicity | 0 | There is no source vocabulary available to map ethnicity values to a source concept ID hence needs to be assigned as 0 |

