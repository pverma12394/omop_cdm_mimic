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

### Table: hcpcsevents

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| subject_id | integer | 10002930 |  |
| hadm_id | integer |  |  |
| chartdate | character varying |  |  |
| hcpcs_cd | character varying | G0378 |  |
| seq_num | integer | 1 |  |
| short_description | character varying | Hospital observation per hr |  |

### Table: inputevents

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| subject_id | integer | 10039708 |  |
| hadm_id | integer | 28258130 |  |
| stay_id | integer | 33281088 |  |
| caregiver_id | integer | 22713 |  |
| starttime | character varying | 2196-02-24 17:30:00 |  |
| endtime | character varying | 2116-02-29 20:01:00 |  |
| storetime | character varying | 2185-01-18 16:25:00 |  |
| itemid | integer | 225158 |  |
| amount | double precision | 1 |  |
| amountuom | character varying | ml |  |
| rate | double precision | NaN |  |
| rateuom | character varying | NaN |  |
| orderid | integer |  |  |
| linkorderid | integer | 4176746 |  |
| ordercategoryname | character varying | 01-Drips |  |
| secondaryordercategoryname | character varying | 02-Fluids (Crystalloids) |  |
| ordercomponenttypedescription | character varying | Main order parameter |  |
| ordercategorydescription | character varying | Continuous Med |  |
| patientweight | double precision | 49.8 |  |
| totalamount | double precision | 100 |  |
| totalamountuom | character varying | ml |  |
| isopenbag | integer | 0 |  |
| continueinnextdept | integer | 0 |  |
| statusdescription | character varying | FinishedRunning |  |
| originalamount | double precision | 1 |  |
| originalrate | double precision | 1 |  |

### Table: drgcodes

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| subject_id | integer | 10014354 |  |
| hadm_id | integer |  |  |
| drg_type | character varying | HCFA |  |
| drg_code | integer | 720 |  |
| description | character varying | SEPTICEMIA & DISSEMINATED INFECTIONS |  |
| drg_severity | double precision | NaN |  |
| drg_mortality | double precision | NaN |  |

### Table: caregiver

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| caregiver_id | integer |  |  |

### Table: d_items

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| itemid | integer |  |  |
| label | character varying |  |  |
| abbreviation | character varying |  |  |
| linksto | character varying | chartevents |  |
| category | character varying | Skin - Impairment |  |
| unitname | character varying | NaN |  |
| param_type | character varying | Text |  |
| lownormalvalue | double precision | NaN |  |
| highnormalvalue | double precision | NaN |  |

### Table: patients

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| subject_id | integer |  |  |
| gender | character varying | M |  |
| anchor_age | integer | 63 |  |
| anchor_year | integer |  |  |
| anchor_year_group | character varying | 2014 - 2016 |  |
| dod | character varying | NaN |  |

### Table: poe_detail

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| poe_id | character varying |  |  |
| poe_seq | integer | 83 |  |
| subject_id | integer | 10014354 |  |
| field_name | character varying | Admit category |  |
| field_value | character varying | Admit to inpatient |  |

### Table: emar_detail

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| subject_id | integer | 10014354 |  |
| emar_id | character varying | 10023117-589 |  |
| emar_seq | integer | 54 |  |
| parent_field_ordinal | double precision | NaN |  |
| administration_type | character varying | NaN |  |
| pharmacy_id | double precision | NaN |  |
| barcode_type | character varying | NaN |  |
| reason_for_no_barcode | character varying | NaN |  |
| complete_dose_not_given | character varying | NaN |  |
| dose_due | character varying | NaN |  |
| dose_due_unit | character varying | NaN |  |
| dose_given | character varying | NaN |  |
| dose_given_unit | character varying | NaN |  |
| will_remainder_of_dose_be_given | character varying | NaN |  |
| product_amount_given | double precision | NaN |  |
| product_unit | character varying | NaN |  |
| product_code | character varying | NaN |  |
| product_description | character varying | NaN |  |
| product_description_other | character varying | NaN |  |
| prior_infusion_rate | double precision | NaN |  |
| infusion_rate | double precision | NaN |  |
| infusion_rate_adjustment | character varying | NaN |  |
| infusion_rate_adjustment_amount | double precision | NaN |  |
| infusion_rate_unit | character varying | NaN |  |
| route | character varying | NaN |  |
| infusion_complete | character varying | NaN |  |
| completion_interval | character varying | NaN |  |
| new_iv_bag_hung | character varying | NaN |  |
| continued_infusion_in_other_location | character varying | NaN |  |
| restart_interval | character varying | NaN |  |
| side | character varying | NaN |  |
| site | character varying | NaN |  |
| non_formulary_visual_verification | character varying | NaN |  |

### Table: microbiologyevents

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| microevent_id | integer |  |  |
| subject_id | integer | 10021487 |  |
| hadm_id | double precision | NaN |  |
| micro_specimen_id | integer | 3575952 |  |
| order_provider_id | character varying | NaN |  |
| chartdate | character varying | 2117-10-26 |  |
| charttime | character varying | NaN |  |
| spec_itemid | integer | 70079 |  |
| spec_type_desc | character varying | URINE |  |
| test_seq | integer | 1 |  |
| storedate | character varying | 2117-10-31 |  |
| storetime | character varying | 2117-10-31 13:18:00 |  |
| test_itemid | integer | 90039 |  |
| test_name | character varying | URINE CULTURE |  |
| org_itemid | double precision | NaN |  |
| org_name | character varying | NaN |  |
| isolate_num | double precision | NaN |  |
| quantity | double precision | NaN |  |
| ab_itemid | double precision | NaN |  |
| ab_name | character varying | NaN |  |
| dilution_text | character varying | NaN |  |
| dilution_comparison | character varying | NaN |  |
| dilution_value | double precision | NaN |  |
| interpretation | character varying | NaN |  |
| comments | character varying | NaN |  |

### Table: admissions

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| subject_id | integer | 10014354 |  |
| hadm_id | integer |  |  |
| admittime | character varying |  |  |
| dischtime | character varying |  |  |
| deathtime | character varying | NaN |  |
| admission_type | character varying | EW EMER. |  |
| admit_provider_id | character varying | P41R5N |  |
| admission_location | character varying | EMERGENCY ROOM |  |
| discharge_location | character varying | HOME HEALTH CARE |  |
| insurance | character varying | Other |  |
| language | character varying | ENGLISH |  |
| marital_status | character varying | SINGLE |  |
| race | character varying | WHITE |  |
| edregtime | character varying | NaN |  |
| edouttime | character varying | NaN |  |
| hospital_expire_flag | integer | 0 |  |

### Table: ingredientevents

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| subject_id | integer | 10039708 |  |
| hadm_id | integer | 28258130 |  |
| stay_id | integer | 33281088 |  |
| caregiver_id | integer | 22713 |  |
| starttime | character varying | 2196-02-24 17:30:00 |  |
| endtime | character varying | 2130-10-27 17:01:00 |  |
| storetime | character varying | 2131-05-26 20:36:00 |  |
| itemid | integer | 220490 |  |
| amount | double precision | 100 |  |
| amountuom | character varying | ml |  |
| rate | double precision | NaN |  |
| rateuom | character varying | mL/hour |  |
| orderid | integer | 525771 |  |
| linkorderid | integer | 4786635 |  |
| statusdescription | character varying | FinishedRunning |  |
| originalamount | integer | 0 |  |
| originalrate | double precision | 100 |  |

### Table: transfers

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| subject_id | integer | 10014354 |  |
| hadm_id | double precision | NaN |  |
| transfer_id | integer |  |  |
| eventtype | character varying | transfer |  |
| careunit | character varying | NaN |  |
| intime | character varying |  |  |
| outtime | character varying | NaN |  |

### Table: prescriptions

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| subject_id | integer | 10014354 |  |
| hadm_id | integer | 23831430 |  |
| pharmacy_id | integer |  |  |
| poe_id | character varying | NaN |  |
| poe_seq | double precision | NaN |  |
| order_provider_id | character varying | P23H5V |  |
| starttime | character varying | 2125-02-27 18:00:00 |  |
| stoptime | character varying | 2135-01-19 14:00:00 |  |
| drug_type | character varying | MAIN |  |
| drug | character varying | Insulin |  |
| formulary_drug_cd | character varying | NACLFLUSH |  |
| gsn | character varying | NaN |  |
| ndc | double precision | 0 |  |
| prod_strength | character varying | 100 Units / mL - 10 mL Vial |  |
| form_rx | character varying | NaN |  |
| dose_val_rx | character varying | 1 |  |
| dose_unit_rx | character varying | mg |  |
| form_val_disp | character varying | 1 |  |
| form_unit_disp | character varying | TAB |  |
| doses_per_24_hrs | double precision | NaN |  |
| route | character varying | IV |  |

### Table: d_icd_procedures

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| icd_code | character varying |  |  |
| icd_version | integer | 10 |  |
| long_title | character varying |  |  |

### Table: d_icd_diagnoses

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| icd_code | character varying |  |  |
| icd_version | integer | 10 |  |
| long_title | character varying |  |  |

### Table: d_labitems

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| itemid | integer |  |  |
| label | character varying | Delete |  |
| fluid | character varying | Blood |  |
| category | character varying | Hematology |  |

### Table: icustays

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| subject_id | integer | 10020740 |  |
| hadm_id | integer |  |  |
| stay_id | integer |  |  |
| first_careunit | character varying | Surgical Intensive Care Unit (SICU) |  |
| last_careunit | character varying | Medical Intensive Care Unit (MICU) |  |
| intime | character varying |  |  |
| outtime | character varying |  |  |
| los | double precision |  |  |

### Table: services

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| subject_id | integer | 10014354 |  |
| hadm_id | integer |  |  |
| transfertime | character varying |  |  |
| prev_service | character varying | NaN |  |
| curr_service | character varying | MED |  |

### Table: diagnoses_icd

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| subject_id | integer | 10014354 |  |
| hadm_id | integer | 29757856 |  |
| seq_num | integer | 1 |  |
| icd_code | character varying | 4019 |  |
| icd_version | integer | 10 |  |

### Table: pharmacy

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| subject_id | integer | 10014354 |  |
| hadm_id | integer | 23831430 |  |
| pharmacy_id | integer |  |  |
| poe_id | character varying | NaN |  |
| starttime | character varying | 2150-04-10 07:00:00 |  |
| stoptime | character varying | NaN |  |
| medication | character varying | NaN |  |
| proc_type | character varying | Unit Dose |  |
| status | character varying | Discontinued |  |
| entertime | character varying | 2167-05-05 13:51:04 |  |
| verifiedtime | character varying | 2167-05-05 13:51:04 |  |
| route | character varying | IV |  |
| frequency | character varying | ONCE |  |
| disp_sched | character varying | NaN |  |
| infusion_type | character varying | NaN |  |
| sliding_scale | character varying | NaN |  |
| lockout_interval | double precision | NaN |  |
| basal_rate | double precision | NaN |  |
| one_hr_max | double precision | NaN |  |
| doses_per_24_hrs | double precision | NaN |  |
| duration | double precision | NaN |  |
| duration_interval | character varying | Ongoing |  |
| expiration_value | double precision | 36 |  |
| expiration_unit | character varying | Hours |  |
| expirationdate | double precision | NaN |  |
| dispensation | character varying | Omnicell |  |
| fill_quantity | double precision | NaN |  |

### Table: chartevents

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| subject_id | integer | 10003400 |  |
| hadm_id | integer | 22987108 |  |
| stay_id | integer | 32359580 |  |
| caregiver_id | double precision | NaN |  |
| storetime | character varying | NaN |  |
| charttime | character varying | 2146-06-29 20:00:00 |  |
| itemid | integer | 227969 |  |
| value | character varying | None |  |
| valueuom | character varying | NaN |  |
| valuenum | double precision | NaN |  |
| warning | double precision | 0 |  |

### Table: outputevents

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| subject_id | integer | 10003400 |  |
| hadm_id | integer | 28998349 |  |
| stay_id | integer | 38197705 |  |
| caregiver_id | integer | 22713 |  |
| charttime | character varying | 2137-03-10 05:00:00 |  |
| storetime | character varying | 2189-09-10 18:52:00 |  |
| itemid | integer | 226559 |  |
| value | integer | 100 |  |
| valueuom | character varying | ml |  |

### Table: procedures_icd

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| subject_id | integer | 10039708 |  |
| hadm_id | integer | 22987108 |  |
| seq_num | integer | 1 |  |
| chartdate | character varying | 2187-02-12 |  |
| icd_code | character varying | 02HV33Z |  |
| icd_version | integer | 9 |  |

### Table: d_hcpcs

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| code | character varying |  |  |
| category | double precision | 1 |  |
| long_description | character varying | NaN |  |
| short_description | character varying | Musculoskeletal system |  |

### Table: labevents

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| labevent_id | integer |  |  |
| subject_id | integer | 10035631 |  |
| hadm_id | double precision | NaN |  |
| specimen_id | integer | 36129047 |  |
| itemid | integer | 50971 |  |
| order_provider_id | character varying | NaN |  |
| charttime | character varying | 2150-05-29 08:59:00 |  |
| storetime | character varying | NaN |  |
| value | character varying | NaN |  |
| valuenum | double precision | NaN |  |
| valueuom | character varying | mg/dL |  |
| ref_range_lower | double precision | NaN |  |
| ref_range_upper | double precision | NaN |  |
| flag | character varying | NaN |  |
| priority | character varying | STAT |  |
| comments | character varying | NaN |  |

### Table: poe

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| poe_id | character varying |  |  |
| poe_seq | integer | 57 |  |
| subject_id | integer | 10014354 |  |
| hadm_id | integer | 28258130 |  |
| ordertime | character varying | 2130-10-27 12:45:12 |  |
| order_type | character varying | Medications |  |
| order_subtype | character varying | NaN |  |
| transaction_type | character varying | New |  |
| discontinue_of_poe_id | character varying | NaN |  |
| discontinued_by_poe_id | character varying | NaN |  |
| order_provider_id | character varying | NaN |  |
| order_status | character varying | Inactive |  |

### Table: datetimeevents

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| subject_id | integer | 10003400 |  |
| hadm_id | integer | 22987108 |  |
| stay_id | integer | 32359580 |  |
| caregiver_id | integer | 22713 |  |
| charttime | character varying | 2118-11-16 23:36:00 |  |
| storetime | character varying | 2137-02-27 12:04:00 |  |
| itemid | integer | 225754 |  |
| value | character varying | 2140-01-30 |  |
| valueuom | character varying | Date |  |
| warning | integer | 0 |  |

### Table: omr

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| subject_id | integer | 10019003 |  |
| chartdate | character varying | 2138-10-31 |  |
| seq_num | integer | 1 |  |
| result_name | character varying | Weight (Lbs) |  |
| result_value | character varying | 71 |  |

### Table: emar

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| subject_id | integer | 10014354 |  |
| hadm_id | double precision | 28258130 |  |
| emar_id | character varying |  |  |
| emar_seq | integer | 21 |  |
| poe_id | character varying | 10005866-999 |  |
| pharmacy_id | double precision | NaN |  |
| enter_provider_id | character varying | NaN |  |
| charttime | character varying | 2147-12-10 08:26:00 |  |
| medication | character varying | Sodium Chloride 0.9%  Flush |  |
| event_txt | character varying | Administered |  |
| scheduletime | character varying | 2148-01-06 08:00:00 |  |
| storetime | character varying | 2147-12-10 08:27:00 |  |

### Table: provider

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| provider_id | character varying |  |  |

### Table: procedureevents

| Field | Type | Most freq. value | Comment |
| --- | --- | --- | --- |
| subject_id | integer | 10021487 |  |
| hadm_id | integer | 28998349 |  |
| stay_id | integer | 38197705 |  |
| caregiver_id | double precision | NaN |  |
| starttime | character varying | 2125-02-27 14:45:00 |  |
| endtime | character varying | 2123-02-26 12:04:00 |  |
| storetime | character varying | 2131-05-26 15:31:00 |  |
| itemid | integer | 224275 |  |
| value | double precision | 1 |  |
| valueuom | character varying | None |  |
| location | character varying | NaN |  |
| locationcategory | character varying | NaN |  |
| orderid | integer |  |  |
| linkorderid | integer |  |  |
| ordercategoryname | character varying | Peripheral Lines |  |
| ordercategorydescription | character varying | Task |  |
| patientweight | double precision | 86.2 |  |
| isopenbag | integer | 0 |  |
| continueinnextdept | integer | 0 |  |
| statusdescription | character varying | FinishedRunning |  |
| originalamount | double precision | 1 |  |
| originalrate | integer | 0 |  |

