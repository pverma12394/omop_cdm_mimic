{{ config(
    schema='pre_qc'
) }}

with diagnosis as (
    select * from
     {{
        source('mimic_iv_ed', 'diagnosis')
     }}
),

missing_subject_ids AS (
    SELECT *
    FROM diagnosis
    WHERE subject_id IS NULL
        OR TRIM(CAST(subject_id AS TEXT)) = ''
)
SELECT * FROM missing_subject_ids
