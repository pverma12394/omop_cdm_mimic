INSERT INTO ohdsi_demo.drug_era
(
    drug_era_id,
    person_id,
    drug_concept_id,
    drug_era_start_date,
    drug_era_end_date,
    drug_exposure_count,
    gap_days
)
SELECT
    ROW_NUMBER() OVER () AS drug_era_id, 

    prescriptions.subject_id AS person_id,

    0 AS drug_concept_id,

    prescriptions.starttime AS drug_era_start_date,

    prescriptions.stoptime AS drug_era_end_date,


    NULL AS drug_exposure_count,


    NULL AS gap_days

FROM mimic_source.prescriptions
;
