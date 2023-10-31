-- Doctors
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(255),
    specialization VARCHAR(255),
    contact_info VARCHAR(255)
);

-- Patients 
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE,
    contact_info VARCHAR(255)
);

-- visits 
CREATE TABLE Visits (
    visit_id INT PRIMARY KEY,
    doctor_id INT,
    patient_id INT,
    visit_date DATE,
    diagnosis TEXT,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- Diseases 
CREATE TABLE Diseases (
    disease_id INT PRIMARY KEY,
    disease_name VARCHAR(255),
    description TEXT
);

-- visitDiseases 
CREATE TABLE VisitDiseases (
    visit_id INT,
    disease_id INT,
    PRIMARY KEY (visit_id, disease_id),
    FOREIGN KEY (visit_id) REFERENCES Visits(visit_id),
    FOREIGN KEY (disease_id) REFERENCES Diseases(disease_id)
);


-- data 

-- Insert a doctor
INSERT INTO Doctors (doctor_id, name, specialization, contact_info) VALUES (1, 'Dr. Smith', 'Cardiologist', '123-456-7890');

-- Insert a patient
INSERT INTO Patients (patient_id, name, date_of_birth, contact_info) VALUES (1, 'John Doe', '1985-05-10', 'johndoe@example.com');

-- Create a visit and associate it with a doctor and a patient
INSERT INTO Visits (visit_id, doctor_id, patient_id, visit_date, diagnosis) VALUES (1, 1, 1, '2023-01-15', 'Hypertension');

-- Add diseases diagnosed during the visit
INSERT INTO VisitDiseases (visit_id, disease_id) VALUES (1, 1); -- Assuming Hypertension has a corresponding disease_id in the Diseases table.
