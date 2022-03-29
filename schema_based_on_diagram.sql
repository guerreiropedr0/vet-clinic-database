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

CREATE TABLE invoices (
   id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
   total_amount DECIMAL,
   generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT
);

CREATE TABLE invoice_items (
   id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
   unit_price DECIMAL,
   quantity INT,
   total_price DECIMAL,
   invoice_id INT,
   treatment_id INT
);

BEGIN;
ALTER TABLE invoice_items
ADD FOREIGN KEY ( invoice_id ) REFERENCES invoices ( id );

ALTER TABLE invoice_items
ADD FOREIGN KEY ( treatment_id ) REFERENCES treatments ( id );
COMMIT;

CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON invoices (medical_history_id);
CREATE INDEX ON invoice_items (invoice_id);
CREATE INDEX ON invoice_items (treatment_id);
CREATE INDEX ON medical_histories_has_treatments (medical_history_id);
CREATE INDEX ON medical_histories_has_treatments (treatment_id);