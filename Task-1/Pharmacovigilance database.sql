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


-- INSERT INTO Lookup_Seriousness (Seriousness_code, Seriousness_Description) VALUES
-- ('SERIOUS', 'The event results in death, is life-threatening, requires inpatient hospitalization, or results in persistent or significant disability.'),
-- ('NON-SERIOUS', 'The event does not meet the criteria for a serious adverse event.'),
-- ('SERIOUS_UNEXPECTED', 'A serious event that is not listed in the current product labeling.'),
-- ('NON_SERIOUS_UNEXPECTED', 'A non-serious event that is not listed in the current product labeling.');


-- INSERT INTO Lookup_Outcome (Outcome_code, Outcome_desription) VALUES
-- ('RECOVERED', 'Patient has fully recovered from the adverse event.'),
-- ('RECOVERING', 'Patient is in the process of recovering from the adverse event.'),
-- ('NOT_RECOVERED', 'Patient has not recovered from the adverse event.'),
-- ('FATAL', 'The adverse event resulted in the patient''s death.'),
-- ('UNKNOWN', 'The outcome of the adverse event is not known.'),
-- ('RECOVERED_WITH_SEQUELAE', 'Patient recovered but with lasting effects or complications.');


-- INSERT INTO Lookup_Drug_Role (role_code, role_decription) VALUES
-- ('SUSPECT', 'The drug is suspected to have caused the adverse event.'),
-- ('CONCOMITANT', 'The drug was taken at the same time as the suspect drug but is not suspected to be the cause.'),
-- ('INTERACTING', 'The drug is believed to have interacted with the suspect drug.');


-- INSERT INTO Lookup_Route (Route_name) VALUES
-- ('Oral'), ('Intravenous'), ('Topical'), ('Subcutaneous'), ('Intramuscular'), ('Inhalation'), ('Ophthalmic'), ('Transdermal'), ('Rectal'), ('Nasal');


-- INSERT INTO Reporters (Reporter_type, name, phone, Email, Organization, Country) VALUES
-- ('Healthcare professional', 'Dr. John Smith', '555-0101', 'john.smith@hospital.com', 'General Hospital', 'USA'),
-- ('Consumer', 'Jane Doe', '555-0102', 'jane.doe@email.com', NULL, 'Canada'),
-- ('Healthcare professional', 'Dr. Emily White', '555-0103', 'emily.white@clinic.org', 'City Clinic', 'UK'),
-- ('Manufacturer', 'PharmaCorp Safety', '555-0104', 'safety@pharmaco.com', 'PharmaCorp Inc.', 'Germany'),
-- ('Consumer', 'Michael Brown', '555-0105', 'mbrown@email.com', NULL, 'Australia'),
-- ('Healthcare professional', 'Dr. Priya Sharma', '555-0106', 'priya.sharma@medcenter.in', 'Apollo Health Center', 'India'),
-- ('Consumer', 'Carlos Ruiz', '555-0107', 'carlos.r@email.com', NULL, 'Spain'),
-- ('Healthcare professional', 'Dr. Chen Wei', '555-0108', 'chen.wei@hospital.cn', 'Beijing United Hospital', 'China'),
-- ('Others', 'Legal Firm Partners', '555-0109', 'legal@lawfirm.com', 'Law & Associates', 'USA'),
-- ('Consumer', 'Fatima Al-Jamil', '555-0110', 'fatima.aj@email.com', NULL, 'UAE');


-- INSERT INTO Patients (Initials, Gender, Date_of_birth, Age_years, Weight_kg, Height_inch) VALUES
-- ('A.B.', 'Male', '1985-06-15', 39, 85.50, 70.0),
-- ('C.D.', 'Female', '1992-11-20', 31, 62.00, 65.5),
-- ('E.F.', 'Unknown', NULL, 45, 75.20, 68.0),
-- ('G.H.', 'Male', '1963-01-30', 61, 92.30, 73.0),
-- ('I.J.', 'Female', '2001-07-10', 23, 55.00, 63.0),
-- ('K.L.', 'Male', '1977-03-25', 47, 78.90, 71.5),
-- ('M.N.', 'Female', '1950-09-05', 74, 68.50, 64.0),
-- ('O.P.', 'Male', NULL, 52, 88.00, 72.0),
-- ('Q.R.', 'Female', '1988-12-12', 35, 60.75, 66.0),
-- ('S.T.', 'Male', '1999-05-18', 25, 70.00, 69.5);


-- INSERT INTO drugs (drug_name, drug_substance, strength, manufacturer, atc_code) VALUES
-- ('Paracetamol 500mg', 'Paracetamol', '500 mg', 'Generic Pharma', 'N02BE01'),
-- ('Ibuprofen 200mg', 'Ibuprofen', '200 mg', 'MedLife Inc.', 'M01AE01'),
-- ('Amoxicillin 250mg', 'Amoxicillin', '250 mg', 'BioHealth', 'J01CA04'),
-- ('Atorvastatin 20mg', 'Atorvastatin', '20 mg', 'CardioWell', 'C10AA05'),
-- ('Metformin 500mg', 'Metformin', '500 mg', 'DiaCare', 'A10BA02'),
-- ('Lisinopril 10mg', 'Lisinopril', '10 mg', 'VasoPharm', 'C09AA03'),
-- ('Aspirin 81mg', 'Acetylsalicylic acid', '81 mg', 'Generic Pharma', 'B01AC06'),
-- ('Omeprazole 20mg', 'Omeprazole', '20 mg', 'GastroCure', 'A02BC01'),
-- ('Salbutamol Inhaler', 'Salbutamol', '100 mcg/dose', 'RespiraGen', 'R03AC02'),
-- ('Cetirizine 10mg', 'Cetirizine', '10 mg', 'AllergyRelief', 'R06AE07');


-- INSERT INTO Reactions (medra_pt, medra_llt, system_organ_class) VALUES
-- ('Nausea', 'Feeling sick', 'Gastrointestinal disorders'),
-- ('Headache', 'Pain in head', 'Nervous system disorders'),
-- ('Dizziness', 'Feeling of lightheadedness', 'Nervous system disorders'),
-- ('Rash', 'Skin eruption', 'Skin and subcutaneous tissue disorders'),
-- ('Vomiting', 'Emesis', 'Gastrointestinal disorders'),
-- ('Fatigue', 'Tiredness', 'General disorders and administration site conditions'),
-- ('Diarrhoea', 'Loose stools', 'Gastrointestinal disorders'),
-- ('Abdominal pain', 'Stomach ache', 'Gastrointestinal disorders'),
-- ('Pruritus', 'Itching', 'Skin and subcutaneous tissue disorders'),
-- ('Somnolence', 'Drowsiness', 'Nervous system disorders');


-- INSERT INTO reports (report_reference, reporter_id, patient_id, receipt_datetime, country_of_report, seriousness_id, outcome_id, narrative) VALUES
-- ('REF-001', 1, 1, '2024-01-15', 'USA', 1, 1, 'Patient developed severe nausea and vomiting after taking Paracetamol.'),
-- ('REF-002', 2, 2, '2024-01-20', 'Canada', 2, 2, 'Consumer reported mild headache and dizziness with Ibuprofen.'),
-- ('REF-003', 3, 3, '2024-02-01', 'UK', 1, 4, 'Patient experienced a severe allergic rash leading to hospitalization. Fatal outcome.'),
-- ('REF-004', 4, 4, '2024-02-10', 'Germany', 1, 3, 'Patient reported muscle pain (myalgia) while on Atorvastatin. Not recovered.'),
-- ('REF-005', 5, 5, '2024-02-18', 'Australia', 2, 1, 'Mild gastrointestinal discomfort reported with Metformin. Patient recovered.'),
-- ('REF-006', 6, 6, '2024-03-05', 'India', 1, 2, 'Patient developed a persistent dry cough after starting Lisinopril. Still recovering.'),
-- ('REF-007', 7, 7, '2024-03-12', 'Spain', 2, 5, 'Consumer felt drowsy after taking Cetirizine. Outcome unknown.'),
-- ('REF-008', 8, 8, '2024-03-22', 'China', 2, 1, 'Patient reported mild indigestion with Omeprazole. Fully recovered.'),
-- ('REF-009', 9, 9, '2024-04-01', 'USA', 1, 6, 'Patient hospitalized due to severe bronchospasm after using Salbutamol inhaler. Recovered with sequelae.'),
-- ('REF-010', 10, 10, '2024-04-05', 'UAE', 2, 1, 'Minor skin itching reported after taking Aspirin.');


-- INSERT INTO report_drugs (report_id, drug_id, role_id, route_id, start_date) VALUES
-- (1, 1, 1, 1, '2024-01-14'), -- Report 1, Paracetamol, Suspect, Oral
-- (1, 2, 2, 1, '2024-01-10'), -- Report 1, Ibuprofen, Concomitant, Oral
-- (2, 2, 1, 1, '2024-01-19'), -- Report 2, Ibuprofen, Suspect, Oral
-- (3, 3, 1, 1, '2024-01-28'), -- Report 3, Amoxicillin, Suspect, Oral
-- (4, 4, 1, 1, '2024-01-15'), -- Report 4, Atorvastatin, Suspect, Oral
-- (4, 6, 2, 1, '2023-12-01'), -- Report 4, Lisinopril, Concomitant, Oral
-- (5, 5, 1, 1, '2024-02-17'), -- Report 5, Metformin, Suspect, Oral
-- (6, 6, 1, 1, '2024-03-01'), -- Report 6, Lisinopril, Suspect, Oral
-- (7, 10, 1, 1, '2024-03-11'),-- Report 7, Cetirizine, Suspect, Oral
-- (8, 8, 1, 1, '2024-03-20'), -- Report 8, Omeprazole, Suspect, Oral
-- (9, 9, 1, 6, '2024-04-01'), -- Report 9, Salbutamol, Suspect, Inhalation
-- (10, 7, 1, 1, '2024-04-04');-- Report 10, Aspirin, Suspect, Oral


-- INSERT INTO report_reactions (report_id, reaction_id, onset_date) VALUES
-- (1, 1, '2024-01-15'), -- Report 1, Nausea
-- (1, 5, '2024-01-15'), -- Report 1, Vomiting
-- (2, 2, '2024-01-20'), -- Report 2, Headache
-- (2, 3, '2024-01-20'), -- Report 2, Dizziness
-- (3, 4, '2024-01-29'), -- Report 3, Rash
-- (4, 8, '2024-02-05'), -- Report 4, Abdominal Pain (as a form of myalgia proxy here)
-- (5, 8, '2024-02-18'), -- Report 5, Abdominal Pain
-- (6, 6, '2024-03-04'), -- Report 6, Fatigue (as a proxy for cough-related issues)
-- (7, 10, '2024-03-12'),-- Report 7, Somnolence
-- (8, 1, '2024-03-21'), -- Report 8, Nausea
-- (9, 6, '2024-04-01'), -- Report 9, Fatigue
-- (10, 9, '2024-04-05');-- Report 10, Pruritus

