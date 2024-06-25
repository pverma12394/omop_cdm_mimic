
INSERT INTO death
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
    patients.csv.subject_id AS person_id,

 -- [MAPPING   LOGIC] DATETIME to DATE 
    patients.csv.dod AS death_date,

    patients.csv.dod AS death_datetime,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS death_type_concept_id,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS cause_concept_id,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS cause_source_value,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS cause_source_concept_id

FROM patients.csv
;