DROP TABLE IF EXISTS studies;
DROP TABLE IF EXISTS reported_events;
DROP TABLE IF EXISTS designs;
DROP TABLE IF EXISTS conditions;
DROP TABLE IF EXISTS facility_contacts;
DROP TABLE IF EXISTS central_contacts;
DROP TABLE IF EXISTS result_contacts;
DROP TABLE IF EXISTS scoreTerms;
DROP TABLE IF EXISTS scorePoints;

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
    CONSTRAINT studies_pk PRIMARY KEY(nct_id)
);

CREATE TABLE conditions (
    id INTEGER,
    nct_id CHARACTER(11),
    name VARCHAR(200),
    downcase_name VARCHAR(200),
    CONSTRAINT conditions_pk PRIMARY KEY(id)
);
CREATE INDEX conditions_nct_id on conditions(nct_id);
CREATE INDEX conditions_name on conditions(name);

CREATE TABLE facility_contacts (
    id INTEGER,
    nct_id CHARACTER(11),
    facility_id INTEGER,
    contact_type VARCHAR(10),
    name VARCHAR(150),
    phone VARCHAR(40),
    email VARCHAR(100),
    CONSTRAINT facility_contacts_pk PRIMARY KEY(id)
);
CREATE INDEX facility_contacts_nct_id on facility_contacts(nct_id);

CREATE TABLE central_contacts (
    id INTEGER,
    nct_id CHARACTER(11),
    name VARCHAR(150),
    phone VARCHAR(40),
    email VARCHAR(100),
    contact_type VARCHAR(10),
    CONSTRAINT central_contacts_pk PRIMARY KEY(id)
);
CREATE INDEX central_contacts_nct_id on central_contacts(nct_id);

CREATE TABLE result_contacts (
    id INTEGER,
    nct_id CHARACTER(11),
    name VARCHAR(150),
    phone VARCHAR(40),
    email VARCHAR(100),
    organization VARCHAR(110),
    CONSTRAINT result_contacts_pk PRIMARY KEY(id)
);
CREATE INDEX result_contacts_nct_id on result_contacts(nct_id);

CREATE TABLE scoreTerms (
	name varchar(250),
    term varchar(200),
    CONSTRAINT scoreTerms_pk PRIMARY KEY(name, term)
);

CREATE TABLE scorePoints (
    term varchar(200),
    points integer,
    CONSTRAINT scorePoints_pk PRIMARY KEY(term)
);