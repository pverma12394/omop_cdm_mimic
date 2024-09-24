INSERT INTO mimic_iv_ed.source_to_concept_map (
    SOURCE_CODE,
    SOURCE_CONCEPT_ID,
    SOURCE_VOCABULARY_ID,
    SOURCE_CODE_DESCRIPTION,
    TARGET_CONCEPT_ID,
    TARGET_VOCABULARY_ID,
    VALID_START_DATE,
    VALID_END_DATE,
    INVALID_REASON
)
WITH CTE_VOCAB_MAP AS (
    SELECT 
        c.concept_code AS SOURCE_CODE, 
        c.concept_id AS SOURCE_CONCEPT_ID, 
        c.vocabulary_id AS SOURCE_VOCABULARY_ID, 
        c.concept_name AS SOURCE_CODE_DESCRIPTION, 
        c1.concept_id AS TARGET_CONCEPT_ID, 
        c1.VOCABULARY_ID AS TARGET_VOCABULARY_ID, 
        c.VALID_START_DATE AS VALID_START_DATE, 
        c.VALID_END_DATE AS VALID_END_DATE, 
        c.INVALID_REASON AS INVALID_REASON
    FROM 
        mimic_iv_ed.CONCEPT c
    JOIN 
        mimic_iv_ed.CONCEPT_RELATIONSHIP cr ON c.CONCEPT_ID = cr.CONCEPT_ID_1
    AND 
        cr.invalid_reason IS NULL
    AND 
        lower(cr.relationship_id) = 'maps to'
    JOIN 
        mimic_iv_ed.CONCEPT c1 ON cr.CONCEPT_ID_2 = c1.CONCEPT_ID
    AND 
        c1.INVALID_REASON IS NULL
    UNION ALL
    SELECT 
        stcm.source_code AS SOURCE_CODE, 
        stcm.SOURCE_CONCEPT_ID, 
        stcm.source_vocabulary_id AS SOURCE_VOCABULARY_ID, 
        stcm.SOURCE_CODE_DESCRIPTION, 
        stcm.target_concept_id AS TARGET_CONCEPT_ID, 
        stcm.target_vocabulary_id AS TARGET_VOCABULARY_ID, 
        c1.VALID_START_DATE AS VALID_START_DATE, 
        c1.VALID_END_DATE AS VALID_END_DATE, 
        stcm.INVALID_REASON AS INVALID_REASON
    FROM 
        mimic_iv_ed.source_to_concept_map stcm
    LEFT OUTER JOIN 
        mimic_iv_ed.CONCEPT c1 ON c1.concept_id = stcm.source_concept_id
    LEFT OUTER JOIN 
        mimic_iv_ed.CONCEPT c2 ON c2.CONCEPT_ID = stcm.target_concept_id
    WHERE 
        stcm.INVALID_REASON IS NULL
)
SELECT *
FROM CTE_VOCAB_MAP;
