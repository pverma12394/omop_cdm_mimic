INSERT INTO ohdsi_demo.dose_era
(
    dose_era_id,
    person_id,
    drug_concept_id,
    unit_concept_id,
    dose_value,
    dose_era_start_date,
    dose_era_end_date
)
SELECT

    ROW_NUMBER() OVER () AS dose_era_id,

    prescriptions.subject_id AS person_id,

    0 AS drug_concept_id,

    0 AS unit_concept_id,

    prescriptions.dose_val_rx AS dose_value,


    NULL AS dose_era_start_date,


    NULL AS dose_era_end_date

FROM mimic_source.prescriptions
;
