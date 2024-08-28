
INSERT INTO ohdsi_demo.care_site
(
    care_site_id,
    care_site_name,
    place_of_service_concept_id,
    location_id,
    care_site_source_value,
    place_of_service_source_value
)
SELECT
    icustays.stay_id AS care_site_id,
    icustays.first_careunit AS care_site_name,
    NULL AS place_of_service_concept_id,
    NULL AS location_id,
    icustays.first_careunit AS care_site_source_value,
    icustays.last_careunit AS place_of_service_source_value
FROM mimic_source.icustays
;