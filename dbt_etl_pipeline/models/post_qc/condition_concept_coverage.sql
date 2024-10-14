{{ config(
    schema='post_qc'
) }}

with condition_occurrence as (
    select * from
     {{
        source('mimic_iv_ed__harmonised', 'condition_occurrence')
     }}
),

coverage AS (
    SELECT
        COUNT(*) AS total_conditions,
        SUM(
            CASE 
                WHEN condition_concept_id IS NULL OR condition_concept_id = 0 THEN 0 
                ELSE 1 
            END
        ) AS valid_conditions
    FROM condition_occurrence
)
SELECT
    *,
    CASE
        WHEN (valid_conditions::DECIMAL / total_conditions) > 0.95 THEN 'PASS'
        WHEN (valid_conditions::DECIMAL / total_conditions) > 0.85 THEN 'WARN'
        ELSE 'FAIL'
    END AS concept_mapping_accuracy
FROM coverage
