# constants.py

# Database configuration
DB_CONFIG = {
    'host': 'localhost',
    'port': '5432',
    'database': 'etl_test',
    'user': 'postgres',
    'password': 'postgres'
}

SCHEMA_PRE_QC = 'mimic_iv_ed_pre_qc'
SCHEMA_POST_QC = 'mimic_iv_ed_post_qc'

TABLES_METRICS_PRE_QC = {
    'Diagnosis': {
        'qc': {
            'duplicate_diagnoses': 'duplicate_diagnoses',
            'missing_diagnoses': 'missing_diagnoses',
            'missing_subject_ids': 'missing_subject_ids',
            'under_granular_codes': 'under_granular_codes'
        }
    },
}

TABLES_METRICS_POST_QC = {
    'condition_occurrence': {
        'qc': {
            'condition_concept_coverage': 'condition_concept_coverage',
        }
    },
}
