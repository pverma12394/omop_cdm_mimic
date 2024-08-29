-- Database: ohdsi

INSERT INTO ohdsi_demo.person
(
    person_id,
    gender_concept_id,
    year_of_birth,
    month_of_birth,
    day_of_birth,
    birth_datetime,
    race_concept_id,
    ethnicity_concept_id,
    location_id,
    provider_id,
    care_site_id,
    person_source_value,
    gender_source_value,
    gender_source_concept_id,
    race_source_value,
    race_source_concept_id,
    ethnicity_source_value,
    ethnicity_source_concept_id
)
SELECT
    p.subject_id AS person_id,
    case upper(p.gender)
      when 'M' then 8507
      when 'F' then 8532
    end as gender_concept_id,
    p.anchor_year AS year_of_birth,
    NULL AS month_of_birth,
    NULL AS day_of_birth,
    NULL AS birth_datetime,
    NULL AS race_concept_id,
    NULL AS ethnicity_concept_id,
    NULL AS location_id,
    NULL AS provider_id,
    NULL AS care_site_id,
    NULL AS person_source_value,
    p.gender AS gender_source_value,
    0 AS gender_source_concept_id,
    NULL AS race_source_value,
    NULL AS race_source_concept_id,
    NULL AS ethnicity_source_value,
    NULL AS ethnicity_source_concept_id

FROM mimic_source.patients p
;