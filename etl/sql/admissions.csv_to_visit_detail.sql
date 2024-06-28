
INSERT INTO ohdsi_demo.visit_detail
(
    visit_detail_id,
    person_id,
    visit_detail_concept_id,
    visit_detail_start_date,
    visit_detail_start_datetime,
    visit_detail_end_date,
    visit_detail_end_datetime,
    visit_detail_type_concept_id,
    provider_id,
    care_site_id,
    visit_detail_source_value,
    visit_detail_source_concept_id,
    admitted_from_concept_id,
    admitted_from_source_value,
    discharged_to_source_value,
    discharged_to_concept_id,
    preceding_visit_detail_id,
    parent_visit_detail_id,
    visit_occurrence_id
)
SELECT
    a.hadm_id AS visit_detail_id,
    a.subject_id AS person_id,
    a.admission_type AS visit_detail_concept_id,

 -- [MAPPING   LOGIC] DATETIME to DATE 
    date(a.admittime) AS visit_detail_start_date,
    a.admittime AS visit_detail_start_datetime,

 -- [MAPPING   LOGIC] DATETIME to DATE 
    date(a.dischtime) AS visit_detail_end_date,
    a.dischtime AS visit_detail_end_datetime,

    NULL AS visit_detail_type_concept_id,
    NULL AS provider_id,
    NULL AS care_site_id,
    a.admission_type AS visit_detail_source_value,
    NULL AS visit_detail_source_concept_id,

	CASE UPPER(a.admission_location)
		when 'EMERGENCY ROOM' then 4176269
		when 'PHYSICIAN REFERRAL' then 45884373
		when 'TRANSFER FROM HOSPITAL' then 44790567
		when 'WALK-IN/SELF REFERRAL' then 44805382
		when 'CLINIC REFERRAL' then 4081947
		when 'PROCEDURE SITE' then 4181646
		when 'PACU' then 40569634
		when 'TRANSFER FROM SKILLED NURSING FACILITY' then 4164912
		when 'INTERNAL TRANSFER TO OR FROM PSYCH' then 0
		when 'INFORMATION NOT AVAILABLE' then 21498751
		when 'AMBULATORY SURGERY TRANSFER' then 21498482
	ELSE 0 END AS admitted_from_concept_id,
    a.admission_location AS admitted_from_source_value,
    a.discharge_location AS discharged_to_source_value,
	CASE UPPER(a.discharge_location) 
		when 'HOME' then 4139502
		when 'HOME HEALTH CARE' then 762451
		when 'SKILLED NURSING FACILITY' then 706296
		when 'REHAB' then 
		when 'DIED' then
		when 'CHRONIC/LONG TERM ACUTE CARE' then
		when 'ACUTE HOSPITAL' then
		when 'HOSPICE' then
		when 'PSYCH FACILITY' then
		when 'AGAINST ADVICE' then
		when 'OTHER FACILITY' then
		when 'ASSISTED LIVING' then
		when 'HEALTHCARE FACILITY' then
	ELSE 0 END AS discharged_to_concept_id,

    NULL AS preceding_visit_detail_id,
    NULL AS parent_visit_detail_id,
    NULL AS visit_occurrence_id

FROM mimic_source.admissions a
;