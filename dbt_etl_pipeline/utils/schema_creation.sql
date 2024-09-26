CREATE SCHEMA IF NOT EXISTS mimic_iv_ed;

CREATE TABLE IF NOT EXISTS mimic_iv_ed.patient (
    subject_id BIGINT PRIMARY KEY,
    gender VARCHAR(20),
    anchor_age INT,
    anchor_year INT,
    anchor_year_group VARCHAR(20),
    dod DATE
);

CREATE TABLE IF NOT EXISTS mimic_iv_ed.medrecon (
    subject_id BIGINT,                 
    stay_id BIGINT,
    charttime TIMESTAMP,
    name TEXT,
    gsn INTEGER,
    ndc BIGINT,
    etc_rn INTEGER,
    etccode INTEGER,
    etcdescription TEXT
);

CREATE TABLE IF NOT EXISTS mimic_iv_ed.pyxis (
    subject_id BIGINT,
    stay_id BIGINT, 
    charttime TIMESTAMP,
    med_rn INTEGER,
    name TEXT,
    gsn INTEGER,
    gsn_rn INTEGER
);

CREATE TABLE IF NOT EXISTS mimic_iv_ed.vitalsign (
    subject_id BIGINT NOT NULL,  
    stay_id BIGINT NOT NULL,
    charttime TIMESTAMP,
    temperature VARCHAR(255),    
    heartrate VARCHAR(255),            
    resprate VARCHAR(255),             
    o2sat VARCHAR(255),                
    sbp VARCHAR(255),                 
    dbp VARCHAR(255),                
    rhythm VARCHAR(255),        
    pain VARCHAR(255)                  
);

CREATE TABLE IF NOT EXISTS mimic_iv_ed.triage (
    subject_id BIGINT NOT NULL,
    stay_id BIGINT NOT NULL,
    temperature VARCHAR(255),
    heartrate VARCHAR(255),
    resprate VARCHAR(255),
    o2sat VARCHAR(255),
    sbp VARCHAR(255),
    dbp VARCHAR(255),
    pain VARCHAR(255),    
    acuity INT,
    chiefcomplaint VARCHAR(255),
    PRIMARY KEY (subject_id, stay_id)
);

CREATE TABLE IF NOT EXISTS mimic_iv_ed.diagnosis (
    subject_id INTEGER NOT NULL,
    stay_id BIGINT NOT NULL,
    seq_num INTEGER,
    icd_code VARCHAR(50),
    icd_version INTEGER,
    icd_title TEXT
);

CREATE TABLE IF NOT EXISTS mimic_iv_ed.edstays (
    subject_id INTEGER NOT NULL,
    hadm_id INTEGER,
    stay_id BIGINT NOT NULL,
    intime TIMESTAMP,
    outtime TIMESTAMP,
    gender TEXT,
    race VARCHAR(50),
    arrival_transport VARCHAR(50),
    disposition VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS mimic_iv_ed.source_to_concept_map (
    source_code varchar(50) NOT NULL,
    source_concept_id integer NOT NULL,
    source_vocabulary_id varchar(20) NOT NULL,
    source_code_description varchar(255) NULL,
    target_concept_id integer NOT NULL,
    target_vocabulary_id varchar(20) NOT NULL,
    valid_start_date date NOT NULL,
    valid_end_date date NOT NULL,
    invalid_reason varchar(1) NULL
);