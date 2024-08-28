UPDATE ohdsi_demo.person p
SET
    ethnicity_concept_id = CASE
        WHEN upper(a.ethnicity) = 'HISPANIC/LATINO' THEN 38003563 ELSE 0
    END,
    ethnicity_source_value = a.ethnicity,
    ethnicity_source_concept_id = 0
FROM mimic_source.admissions a
WHERE p.person_id = a.subject_id;

INSERT INTO ohdsi_demo.person
(	
	person_id,
    ethnicity_concept_id,
	ethnicity_source_value,
    ethnicity_source_concept_id
)
SELECT
	a.subject_id AS person_id,
    CASE
		WHEN upper(a.ethnicity) = 'HISPANIC/LATINO' THEN 38003563 ELSE 0
	END AS ethnicity_concept_id,
    a.ethnicity AS ethnicity_source_value,
    0 AS ethnicity_source_concept_id
FROM mimic_source.admissions a
LEFT JOIN ohdsi_demo.person p ON a.subject_id = p.person_id
WHERE p.person_id IS NULL;
