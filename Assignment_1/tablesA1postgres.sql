CREATE TABLE studies (
    nct_id CHARACTER(11),
    start_date DATE,
    start_date_type CHARACTER(11),
    completion_date DATE,
    completion_date_type CHARACTER(11),
    study_type  VARCHAR(35),
    brief_title VARCHAR(350),
    overall_status   VARCHAR(35),
    phase   VARCHAR(20),
    enrollment INTEGER,
    enrollment_type CHARACTER(11),
    source VARCHAR(150),
    why_stopped VARCHAR(200),
    is_fda_regulated_drug BOOLEAN,
    PRIMARY KEY (nct_id)
);


CREATE TABLE reported_events(
    id INTEGER,
    nct_id CHARACTER(11),
    event_type VARCHAR(15),
    subjects_affected INTEGER,
    subjects_at_risk INTEGER,
    description VARCHAR(500),
    event_count INTEGER,
    organ_system VARCHAR(100),
    adverse_event_term VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE designs (
    id INTEGER,
    nct_id CHARACTER(11),
    allocation VARCHAR(15),
    intervention_model VARCHAR(25),
    observational_model VARCHAR(25),
    primary_purpose VARCHAR(25),
    time_perspective VARCHAR(25),
    masking VARCHAR(25),
    masking_description VARCHAR(1000),
    intervention_model_description VARCHAR(1000),
    subject_masked BOOLEAN,
    caregiver_masked BOOLEAN,
    investigator_masked BOOLEAN,
    outcomes_assessor_masked BOOLEAN,
    PRIMARY KEY (id)
);


CREATE TABLE conditions (
    id INTEGER,
    nct_id CHARACTER(11),
    name VARCHAR(200),
    downcase_name VARCHAR(200),
    PRIMARY KEY (id)
);

