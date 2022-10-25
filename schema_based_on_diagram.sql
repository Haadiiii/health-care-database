CREATE TABLE  patients IF NOT EXISTS(
  id INT(9) SERIAL NOT NULL,
  name VARCHAR(255) NOT NULL,
  dob DATE NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE  medical_histories IF NOT EXISTS(
  id INT(9) SERIAL NOT NULL,
  admitted_at TIMESTAMP NOT NULL,
  patient_id INT(9),
  PRIMARY KEY(id),
  FOREIGN KEY(patient_id) REFERENCES patients(id)
  
);

CREATE TABLE  treatments IF NOT EXISTS(
  id INT(9) SERIAL NOT NULL,
 type VARCHAR(255) NOT NULL,
 name VARCHAR(255) NOT NULL
  
);

CREATE TABLE  invoices IF NOT EXISTS(
  id INT(9) SERIAL NOT NULL,
  total_amount DECIMAL(25) NOT NULL,
  generated_at TIMESTAMP NOT NULL, 
  payed_at TIMESTAMP NOT NULL,
  medical_histories_id INT(9),
  PRIMARY KEY(id),
  FOREIGN KEY(medical_histories_id) REFERENCES medical_histories(id)
);

CREATE TABLE  invoice_items IF NOT EXISTS(
  id INT(9) SERIAL NOT NULL,
  unit_price DECIMAL(9) NOT NULL,
  quantity INT(25) NOT NULL, 
  invoice_id INT(9),
  treatment_id INT(9),
  total_price DECIMAL(25),
  PRIMARY KEY(id),
  FOREIGN KEY( invoice_id) REFERENCES  invoices(id),
   FOREIGN KEY( treatment_id) REFERENCES  treatments(id)
);

CREATE TABLE  join_table IF NOT EXISTS(
  id INT(9) SERIAL NOT NULL,
  medical_histories_id int(9),
  treatment_id INT(9),
  PRIMARY KEY(id),
  FOREIGN KEY( medical_histories_id) REFERENCES  medical_histories(id),
  FOREIGN KEY( treatment_id) REFERENCES  treatments(id)
 
  
);