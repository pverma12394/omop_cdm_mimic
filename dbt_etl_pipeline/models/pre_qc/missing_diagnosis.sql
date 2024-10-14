{{ config(
    schema='pre_qc'
) }}

with diagnosis as (
    select * from
     {{
        source('mimic_iv_ed', 'diagnosis')
     }}
),

missing_diagnosis AS (
    SELECT *
    FROM diagnosis
    WHERE icd_code IS NULL
)
SELECT * FROM missing_diagnosis