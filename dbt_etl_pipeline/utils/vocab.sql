CREATE SCHEMA IF NOT EXISTS mimic_iv_ed;

COPY mimic_iv_ed.DRUG_STRENGTH FROM '/Users/pawan/Documents/Elucidata/ETL-omop/dbt_etl_pipeline/vocabulary/DRUG_STRENGTH.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b' ;

COPY mimic_iv_ed.CONCEPT FROM '/Users/pawan/Documents/Elucidata/ETL-omop/dbt_etl_pipeline/vocabulary/CONCEPT.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b' ;

COPY mimic_iv_ed.CONCEPT_RELATIONSHIP FROM '/Users/pawan/Documents/Elucidata/ETL-omop/dbt_etl_pipeline/vocabulary/CONCEPT_RELATIONSHIP.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b' ;

COPY mimic_iv_ed.CONCEPT_ANCESTOR FROM '/Users/pawan/Documents/Elucidata/ETL-omop/dbt_etl_pipeline/vocabulary/CONCEPT_ANCESTOR.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b' ;

COPY mimic_iv_ed.CONCEPT_SYNONYM FROM '/Users/pawan/Documents/Elucidata/ETL-omop/dbt_etl_pipeline/vocabulary/CONCEPT_SYNONYM.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b' ;

COPY mimic_iv_ed.VOCABULARY FROM '/Users/pawan/Documents/Elucidata/ETL-omop/dbt_etl_pipeline/vocabulary/VOCABULARY.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b' ;

COPY mimic_iv_ed.RELATIONSHIP FROM '/Users/pawan/Documents/Elucidata/ETL-omop/dbt_etl_pipeline/vocabulary/RELATIONSHIP.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b' ;

COPY mimic_iv_ed.CONCEPT_CLASS FROM '/Users/pawan/Documents/Elucidata/ETL-omop/dbt_etl_pipeline/vocabulary/CONCEPT_CLASS.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b' ;

COPY mimic_iv_ed.DOMAIN FROM '/Users/pawan/Documents/Elucidata/ETL-omop/dbt_etl_pipeline/vocabulary/DOMAIN.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b' ;