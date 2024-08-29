## Table name: drug_exposure

### Reading from prescriptions

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| drug_exposure_id |  |  |  |
| person_id | subject_id |  |  |
| drug_concept_id | drug |  |  |
| drug_exposure_start_date | starttime |  |  |
| drug_exposure_start_datetime | starttime |  |  |
| drug_exposure_end_date | stoptime |  |  |
| drug_exposure_end_datetime | stoptime |  |  |
| verbatim_end_date |  |  |  |
| drug_type_concept_id | drug_type |  |  |
| stop_reason |  |  |  |
| refills |  |  |  |
| quantity |  |  |  |
| days_supply |  |  |  |
| sig | prod_strength |  |  |
| route_concept_id | route |  |  |
| lot_number |  |  |  |
| provider_id | order_provider_id |  |  |
| visit_occurrence_id | hadm_id |  |  |
| visit_detail_id |  |  |  |
| drug_source_value | drug |  |  |
| drug_source_concept_id | ndc |  |  |
| route_source_value | route |  |  |
| dose_unit_source_value | dose_val_rx<br>dose_unit_rx |  |  |

### Reading from pharmacy

![](md_files/image2.png)

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| drug_exposure_id |  |  |  |
| person_id | subject_id |  |  |
| drug_concept_id | medication |  |  |
| drug_exposure_start_date | starttime |  |  |
| drug_exposure_start_datetime | starttime |  |  |
| drug_exposure_end_date | stoptime |  |  |
| drug_exposure_end_datetime | stoptime |  |  |
| verbatim_end_date |  |  |  |
| drug_type_concept_id |  |  |  |
| stop_reason |  |  |  |
| refills |  |  |  |
| quantity |  |  |  |
| days_supply |  |  |  |
| sig |  |  |  |
| route_concept_id | route |  |  |
| lot_number |  |  |  |
| provider_id |  |  |  |
| visit_occurrence_id | hadm_id |  |  |
| visit_detail_id |  |  |  |
| drug_source_value | medication |  |  |
| drug_source_concept_id |  |  |  |
| route_source_value | route |  |  |
| dose_unit_source_value |  |  |  |

