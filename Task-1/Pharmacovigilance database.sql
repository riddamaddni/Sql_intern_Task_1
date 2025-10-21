-- DROP DATABASE IF EXISTS pv_db;
-- CREATE DATABASE pv_db;
-- USE pv_db;


-- CREATE TABLE Lookup_Seriousness(
-- Seriousness_id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
-- Seriousness_code VARCHAR(50) NOT NULL UNIQUE,
-- Seriousness_Description VARCHAR(300) 
-- );


-- CREATE TABLE Lookup_Outcome(
-- Outcome_id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
-- Outcome_code VARCHAR(50) NOT NULL UNIQUE,
-- Outcome_desription VARCHAR(300)
-- ); 


-- CREATE TABLE Lookup_Drug_Role(
-- role_id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
-- role_code VARCHAR(50) NOT NULL UNIQUE,
-- role_decription VARCHAR(300)
-- );


-- CREATE TABLE Lookup_Route(
-- Route_id SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
-- Route_name VARCHAR(50) NOT NULL UNIQUE 
-- );


-- CREATE TABLE Reporters(
-- Reporter_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
-- Reporter_type ENUM("Healthcare professional","Consumer","Manufacturer","Others"),
-- name VARCHAR(50),
-- phone VARCHAR(20),
-- Email VARCHAR(100),
-- Organization VARCHAR(150),
-- Country VARCHAR(50),
-- Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );


-- CREATE TABLE Patients(
-- Patient_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
-- Initials VARCHAR(20),
-- Gender ENUM("Male","Female","Unknown") DEFAULT "Unknown",
-- Date_of_birth date,
-- Age_years SMALLINT UNSIGNED,
-- Weight_kg DECIMAL(6,2),
-- Height_inch DECIMAL(6,2),
-- Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );


-- CREATE TABLE reports (
--   report_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
--   report_reference VARCHAR(50) UNIQUE,
--   reporter_id INT UNSIGNED NOT NULL,
--   patient_id INT UNSIGNED NOT NULL,
--   report_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
--   receipt_datetime DATE,
--   country_of_report VARCHAR(80),
--   seriousness_id TINYINT UNSIGNED,
--   outcome_id TINYINT UNSIGNED,
--   narrative TEXT,
--   source_system VARCHAR(80),
--   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--   FOREIGN KEY (reporter_id) REFERENCES reporters(reporter_id),
--   FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
--   );


-- CREATE TABLE drugs (
--   drug_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
--   drug_name VARCHAR(200) NOT NULL,
--   drug_substance VARCHAR(200),
--   strength VARCHAR(50),
--   manufacturer VARCHAR(150),
--   atc_code VARCHAR(20),
--   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );


-- CREATE TABLE report_drugs (
--   report_drug_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
--   report_id INT UNSIGNED NOT NULL,
--   drug_id INT UNSIGNED NOT NULL,
--   role_id TINYINT UNSIGNED NOT NULL,
--   route_id SMALLINT UNSIGNED,
--   start_date DATE,
--   FOREIGN KEY (report_id) REFERENCES reports(report_id),
--   FOREIGN KEY (drug_id) REFERENCES drugs(drug_id),
--   FOREIGN KEY (role_id) REFERENCES lookup_drug_role(role_id)
-- );


-- CREATE TABLE Reactions(
-- reaction_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
-- medra_pt VARCHAR(200) NOT NULL, 
-- medra_llt VARCHAR(200),
-- system_organ_class VARCHAR(150)
-- );


-- CREATE TABLE report_reactions (
--   report_reaction_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
--   report_id INT UNSIGNED NOT NULL,
--   reaction_id INT UNSIGNED NOT NULL,
--   onset_date DATE,
--   FOREIGN KEY (report_id) REFERENCES reports(report_id),
--   FOREIGN KEY (reaction_id) REFERENCES reactions(reaction_id)
-- );



