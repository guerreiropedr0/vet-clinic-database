CREATE TABLE medical_histories (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR(100)
);

CREATE TABLE patients (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  date_of_birth DATE
);

BEGIN;
ALTER TABLE medical_histories
ADD FOREIGN KEY (patient_id) REFERENCES patients (id);
COMMIT;

CREATE TABLE treatments (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  type VARCHAR(100),
  name VARCHAR(100)
);

CREATE TABLE medical_info (
  medical_histories_id INT,
  treatments_id INT,
  CONSTRAINT fk_medical_histories FOREIGN KEY (medical_histories_id) REFERENCES medical_histories (id),
    CONSTRAINT fk_treatments FOREIGN KEY (treatments_id) REFERENCES treatments (id)
);
