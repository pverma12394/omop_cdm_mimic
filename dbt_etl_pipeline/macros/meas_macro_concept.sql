{% macro map_measurement(source, vital_column, concept_id) %}
    select
        -- Generate measurement_id by adding a random integer to subject_id
        {{ source }}.subject_id + {{ source }}.stay_id + (floor(random() * 100000000000)) as measurement_id,  -- Adjust the random number range as needed
        {{ source }}.subject_id as person_id,
        {{ concept_id }} as measurement_concept_id,

        {% if source == 'vitalsign' %}
            CAST(date({{ source }}.charttime) AS TEXT) as measurement_date,
            CAST({{ source }}.charttime AS TEXT) as measurement_datetime,
            CASE 
                WHEN EXTRACT(HOUR FROM {{ source }}.charttime) IS NOT NULL THEN 
                    LPAD(CAST(EXTRACT(HOUR FROM {{ source }}.charttime) AS TEXT), 2, '0') || ':' ||
                    LPAD(CAST(EXTRACT(MINUTE FROM {{ source }}.charttime) AS TEXT), 2, '0') || ':' ||
                    LPAD(CAST(EXTRACT(SECOND FROM {{ source }}.charttime) AS TEXT), 2, '0')
                ELSE '00:00:00'
            END as measurement_time,
        {% else %}
            CAST(NULL AS TEXT) as measurement_date,
            CAST(NULL AS TEXT) as measurement_datetime,
            CAST(NULL AS TEXT) as measurement_time,
        {% endif %}

        0 as measurement_type_concept_id,
        0 as operator_concept_id,

        {% if source == 'triage' %}
            {{ source }}.acuity as value_as_number,
            0 as value_as_concept_id,
        {% else %}
            NULL as value_as_number,
            0 as value_as_concept_id,
        {% endif %}

        0 as unit_concept_id,
        NULL as range_low,
        NULL as range_high,
        NULL as provider_id,
        {{ source }}.stay_id as visit_occurrence_id,
        NULL as visit_detail_id,
        {{ source }}.{{ vital_column }} as measurement_source_value,
        NULL as measurement_source_concept_id,
        NULL as unit_source_value,
        NULL as unit_source_concept_id,

        {% if source == 'triage' %}
            {{ source }}.chiefcomplaint as value_source_value,
        {% else %}
            NULL as value_source_value,
        {% endif %}

        NULL as measurement_event_id,
        0 as meas_event_field_concept_id
    from 
        {{ source }}
{% endmacro %}
