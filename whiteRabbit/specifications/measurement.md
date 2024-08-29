## Table name: measurement

### Reading from chartevents

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| measurement_id |  |  |  |
| person_id | subject_id |  |  |
| measurement_concept_id |  |  |  |
| measurement_date | storetime |  |  |
| measurement_datetime | storetime |  |  |
| measurement_time | storetime |  |  |
| measurement_type_concept_id |  |  |  |
| operator_concept_id |  |  |  |
| value_as_number | valuenum |  |  |
| value_as_concept_id | valuenum |  |  |
| unit_concept_id | valueuom |  |  |
| range_low |  |  |  |
| range_high |  |  |  |
| provider_id |  |  |  |
| visit_occurrence_id | hadm_id |  |  |
| visit_detail_id |  |  |  |
| measurement_source_value |  |  |  |
| measurement_source_concept_id |  |  |  |
| unit_source_value | valueuom |  |  |
| unit_source_concept_id |  |  |  |
| value_source_value | value |  |  |
| measurement_event_id |  |  |  |
| meas_event_field_concept_id |  |  |  |

### Reading from outputevents

![](md_files/image4.png)

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| measurement_id |  |  |  |
| person_id | subject_id |  |  |
| measurement_concept_id |  |  |  |
| measurement_date | storetime |  |  |
| measurement_datetime | storetime |  |  |
| measurement_time | storetime |  |  |
| measurement_type_concept_id |  |  |  |
| operator_concept_id |  |  |  |
| value_as_number | value |  |  |
| value_as_concept_id | value |  |  |
| unit_concept_id | valueuom |  |  |
| range_low |  |  |  |
| range_high |  |  |  |
| provider_id |  |  |  |
| visit_occurrence_id | hadm_id |  |  |
| visit_detail_id |  |  |  |
| measurement_source_value |  |  |  |
| measurement_source_concept_id |  |  |  |
| unit_source_value | valueuom |  |  |
| unit_source_concept_id |  |  |  |
| value_source_value |  |  |  |
| measurement_event_id |  |  |  |
| meas_event_field_concept_id |  |  |  |

### Reading from labevents

![](md_files/image5.png)

| Destination Field | Source field | Logic | Comment field |
| --- | --- | --- | --- |
| measurement_id | labevent_id |  |  |
| person_id | subject_id |  |  |
| measurement_concept_id |  |  |  |
| measurement_date | storetime |  |  |
| measurement_datetime | storetime |  |  |
| measurement_time | storetime |  |  |
| measurement_type_concept_id |  |  |  |
| operator_concept_id |  |  |  |
| value_as_number | valuenum |  |  |
| value_as_concept_id | valuenum |  |  |
| unit_concept_id | valueuom |  |  |
| range_low | ref_range_lower |  |  |
| range_high | ref_range_upper |  |  |
| provider_id | order_provider_id |  |  |
| visit_occurrence_id | hadm_id |  |  |
| visit_detail_id |  |  |  |
| measurement_source_value |  |  |  |
| measurement_source_concept_id |  |  |  |
| unit_source_value | valueuom |  |  |
| unit_source_concept_id |  |  |  |
| value_source_value | value |  |  |
| measurement_event_id |  |  |  |
| meas_event_field_concept_id |  |  |  |

