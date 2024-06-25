
INSERT INTO care_site
(
    care_site_id,
    care_site_name,
    place_of_service_concept_id,
    location_id,
    care_site_source_value,
    place_of_service_source_value
)
SELECT
    icustays.csv.stay_id AS care_site_id,

    icustays.csv.first_careunit AS care_site_name,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS place_of_service_concept_id,

 -- [!WARNING!] no source column found. See possible comment at the INSERT INTO
    NULL AS location_id,

    icustays.csv.first_careunit AS care_site_source_value,

    icustays.csv.last_careunit AS place_of_service_source_value

FROM icustays.csv
;