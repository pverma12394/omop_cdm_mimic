CREATE SCHEMA IF NOT EXISTS omop_raw;

CREATE TABLE IF NOT EXISTS omop_raw.medrecon (
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

CREATE TABLE IF NOT EXISTS omop_raw.pyxis (
    subject_id BIGINT,
    stay_id BIGINT, 
    charttime TIMESTAMP,
    med_rn INTEGER,
    name TEXT,
    gsn INTEGER,
    gsn_rn INTEGER
);

CREATE TABLE IF NOT EXISTS omop_raw.vitalsign (
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

CREATE TABLE IF NOT EXISTS omop_raw.triage (
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

CREATE TABLE IF NOT EXISTS omop_raw.diagnosis (
    subject_id INTEGER NOT NULL,
    stay_id BIGINT NOT NULL,
    seq_num INTEGER,
    icd_code VARCHAR(50),
    icd_version INTEGER,
    icd_title TEXT
);

CREATE TABLE IF NOT EXISTS omop_raw.edstays (
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