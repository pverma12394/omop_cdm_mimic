{{ config(
    schema='pre_qc'
) }}

with diagnosis as (
    select * from
     {{
        source('mimic_iv_ed', 'diagnosis')
     }}
),

diagnosis_deduplicated AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY subject_id, stay_id, icd_code ORDER BY subject_id) AS row_num
    FROM diagnosis
)
SELECT *
FROM diagnosis_deduplicated
WHERE row_num > 1
