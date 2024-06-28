# Appendix: source tables

### Table: patients.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| subject_id | INT |  |  |
| gender | VARCHAR | F |  |
| anchor_age | INT | 0 |  |
| anchor_year | INT | 2153 |  |
| anchor_year_group | VARCHAR | 2008 - 2010 |  |
| dod | VARCHAR |  |  |

### Table: admissions.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| subject_id | INT | 10714009 |  |
| hadm_id | INT |  |  |
| admittime | VARCHAR |  |  |
| dischtime | VARCHAR |  |  |
| deathtime | VARCHAR |  |  |
| admission_type | VARCHAR | EW EMER. |  |
| admission_location | VARCHAR | EMERGENCY ROOM |  |
| discharge_location | VARCHAR | HOME |  |
| insurance | VARCHAR | Other |  |
| language | VARCHAR | ENGLISH |  |
| marital_status | VARCHAR | MARRIED |  |
| ethnicity | VARCHAR | WHITE |  |
| edregtime | VARCHAR |  |  |
| edouttime | VARCHAR |  |  |
| hospital_expire_flag | INT | 0 |  |

### Table: icustays.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| subject_id | INT | 18358138 |  |
| hadm_id | INT | 27373827 |  |
| stay_id | INT |  |  |
| first_careunit | VARCHAR | Medical Intensive Care Unit (MICU) |  |
| last_careunit | VARCHAR | Medical Intensive Care Unit (MICU) |  |
| intime | VARCHAR |  |  |
| outtime | VARCHAR |  |  |
| los | REAL | 1.0220717592592592 |  |

### Table: diagnoses_icd.csv

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| subject_id | INT | 12985376 |  |
| hadm_id | INT | 26693268 |  |
| seq_num | INT | 1 |  |
| icd_code | VARCHAR | 4019 |  |
| icd_version | INT | 9 |  |

