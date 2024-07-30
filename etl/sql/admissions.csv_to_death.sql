INSERT INTO ohdsi_demo.death
(
    person_id,
    death_date,
    death_datetime,
    death_type_concept_id,
    cause_concept_id,
    cause_source_value,
    cause_source_concept_id
)
SELECT
    p.subject_id AS person_id,
    date(p.dod) AS death_date,
    p.dod AS death_datetime,
    NULL AS death_type_concept_id,
    NULL AS cause_concept_id,
    NULL AS cause_source_value,
    NULL AS cause_source_concept_id

FROM mimic_source.patients p
;