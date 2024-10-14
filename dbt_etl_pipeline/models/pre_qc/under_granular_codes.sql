{{ config(
    schema='pre_qc'
) }}

with diagnosis as (
    select * from
     {{
        source('mimic_iv_ed', 'diagnosis')
     }}
),

icd_validation AS (
    SELECT *,
           CASE WHEN icd_version = 10 AND NOT icd_code ~ '^[A-Z]\d{1,4}(\.\d{1,4})?$' THEN 1
                WHEN icd_version != 10 AND NOT icd_code ~ '^\d{1,3}(\.\d{1,2})?$' THEN 1
                ELSE 0
           END AS invalid_icd
    FROM diagnosis
)
SELECT *
FROM icd_validation
WHERE invalid_icd = 1
