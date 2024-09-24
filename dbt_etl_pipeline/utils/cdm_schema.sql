CREATE TABLE atlas_mimic_iv_ed_demo.condition_occurrence (
			condition_occurrence_id integer NULL,
			person_id integer NOT NULL,
			condition_concept_id integer NOT NULL,
			condition_start_date date NULL,
			condition_start_datetime TIMESTAMP NULL,
			condition_end_date date NULL,
			condition_end_datetime TIMESTAMP NULL,
			condition_type_concept_id integer NULL,
			condition_status_concept_id integer NULL,
			stop_reason varchar(255) NULL,
			provider_id integer NULL,
			visit_occurrence_id integer NULL,
			visit_detail_id integer NULL,
			condition_source_value varchar(255) NULL,
			condition_source_concept_id text NULL,
			condition_status_source_value varchar(50) NULL );

CREATE TABLE atlas_mimic_iv_ed_demo.measurement (
			measurement_id integer NULL,
			person_id integer NOT NULL,
			measurement_concept_id integer NOT NULL,
			measurement_date date NULL,
			measurement_datetime TIMESTAMP NULL,
			measurement_time varchar(20) NULL,
			measurement_type_concept_id integer NULL,
			operator_concept_id integer NULL,
			value_as_number NUMERIC NULL,
			value_as_concept_id integer NULL,
			unit_concept_id integer NULL,
			range_low NUMERIC NULL,
			range_high NUMERIC NULL,
			provider_id integer NULL,
			visit_occurrence_id integer NULL,
			visit_detail_id integer NULL,
			measurement_source_value varchar(50) NULL,
			measurement_source_concept_id integer NULL,
			unit_source_value varchar(50) NULL,
			unit_source_concept_id integer NULL,
			value_source_value varchar(50) NULL,
			measurement_event_id integer NULL,
			meas_event_field_concept_id integer NULL );

CREATE TABLE atlas_mimic_iv_ed_demo.visit_occurrence (
			visit_occurrence_id integer NULL,
			person_id integer NOT NULL,
			visit_concept_id integer NOT NULL,
			visit_start_date date NULL,
			visit_start_datetime TIMESTAMP NULL,
			visit_end_date date NULL,
			visit_end_datetime TIMESTAMP NULL,
			visit_type_concept_id integer NULL,
			provider_id integer NULL,
			care_site_id integer NULL,
			visit_source_value varchar(255) NULL,
			visit_source_concept_id integer NULL,
			admitted_from_concept_id integer NULL,
			admitted_from_source_value varchar(255) NULL,
			discharged_to_concept_id integer NULL,
			discharged_to_source_value varchar(255) NULL,
			preceding_visit_occurrence_id integer NULL );

CREATE TABLE atlas_mimic_iv_ed_demo.drug_exposure (
			drug_exposure_id integer NULL,
			person_id integer NOT NULL,
			drug_concept_id integer NOT NULL,
			drug_exposure_start_date date NULL,
			drug_exposure_start_datetime TIMESTAMP NULL,
			drug_exposure_end_date date NULL,
			drug_exposure_end_datetime TIMESTAMP NULL,
			verbatim_end_date date NULL,
			drug_type_concept_id integer NULL,
			stop_reason varchar(255) NULL,
			refills integer NULL,
			quantity NUMERIC NULL,
			days_supply integer NULL,
			sig TEXT NULL,
			route_concept_id integer NULL,
			lot_number varchar(50) NULL,
			provider_id integer NULL,
			visit_occurrence_id integer NULL,
			visit_detail_id integer NULL,
			drug_source_value varchar(255) NULL,
			drug_source_concept_id text NULL,
			route_source_value varchar(50) NULL,
			dose_unit_source_value varchar(50) NULL );

CREATE TABLE atlas_mimic_iv_ed_demo.concept (
			concept_id integer NOT NULL,
			concept_name varchar(255) NOT NULL,
			domain_id varchar(20) NOT NULL,
			vocabulary_id varchar(20) NOT NULL,
			concept_class_id varchar(20) NOT NULL,
			standard_concept varchar(1) NULL,
			concept_code varchar(50) NOT NULL,
			valid_start_date date NOT NULL,
			valid_end_date date NOT NULL,
			invalid_reason varchar(1) NULL );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE atlas_mimic_iv_ed_demo.vocabulary (
			vocabulary_id varchar(20) NOT NULL,
			vocabulary_name varchar(255) NOT NULL,
			vocabulary_reference varchar(255) NULL,
			vocabulary_version varchar(255) NULL,
			vocabulary_concept_id integer NOT NULL );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE atlas_mimic_iv_ed_demo.domain (
			domain_id varchar(20) NOT NULL,
			domain_name varchar(255) NOT NULL,
			domain_concept_id integer NOT NULL );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE atlas_mimic_iv_ed_demo.concept_class (
			concept_class_id varchar(20) NOT NULL,
			concept_class_name varchar(255) NOT NULL,
			concept_class_concept_id integer NOT NULL );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE atlas_mimic_iv_ed_demo.concept_relationship (
			concept_id_1 integer NOT NULL,
			concept_id_2 integer NOT NULL,
			relationship_id varchar(20) NOT NULL,
			valid_start_date date NOT NULL,
			valid_end_date date NOT NULL,
			invalid_reason varchar(1) NULL );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE atlas_mimic_iv_ed_demo.relationship (
			relationship_id varchar(20) NOT NULL,
			relationship_name varchar(255) NOT NULL,
			is_hierarchical varchar(1) NOT NULL,
			defines_ancestry varchar(1) NOT NULL,
			reverse_relationship_id varchar(20) NOT NULL,
			relationship_concept_id integer NOT NULL );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE atlas_mimic_iv_ed_demo.concept_synonym (
			concept_id integer NOT NULL,
			concept_synonym_name varchar(1000) NOT NULL,
			language_concept_id integer NOT NULL );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE atlas_mimic_iv_ed_demo.concept_ancestor (
			ancestor_concept_id integer NOT NULL,
			descendant_concept_id integer NOT NULL,
			min_levels_of_separation integer NOT NULL,
			max_levels_of_separation integer NOT NULL );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE atlas_mimic_iv_ed_demo.source_to_concept_map (
			source_code varchar(50) NOT NULL,
			source_concept_id integer NOT NULL,
			source_vocabulary_id varchar(20) NOT NULL,
			source_code_description varchar(255) NULL,
			target_concept_id integer NOT NULL,
			target_vocabulary_id varchar(20) NOT NULL,
			valid_start_date date NOT NULL,
			valid_end_date date NOT NULL,
			invalid_reason varchar(1) NULL );
--HINT DISTRIBUTE ON RANDOM
CREATE TABLE atlas_mimic_iv_ed_demo.drug_strength (
			drug_concept_id integer NOT NULL,
			ingredient_concept_id integer NOT NULL,
			amount_value NUMERIC NULL,
			amount_unit_concept_id integer NULL,
			numerator_value NUMERIC NULL,
			numerator_unit_concept_id integer NULL,
			denominator_value NUMERIC NULL,
			denominator_unit_concept_id integer NULL,
			box_size integer NULL,
			valid_start_date date NOT NULL,
			valid_end_date date NOT NULL,
			invalid_reason varchar(1) NULL );