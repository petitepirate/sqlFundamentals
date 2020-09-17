-- from the terminal run:
-- psql < med_center.sql

DROP DATABASE IF EXISTS med_center;

CREATE DATABASE med_center;

\c med_center

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    hired TEXT NOT NULL,
    specialty TEXT NOT NULL
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    social FLOAT NOT NULL,
    birthdate TEXT NOT NULL
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT NOT NULL

);

CREATE TABLE appointment
(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients,
    doctor_id INTEGER REFERENCES doctors,
    prim_diagnosis INTEGER REFERENCES diseases,
    second_diagnosis INTEGER REFERENCES diseases,
    notes TEXT
);

INSERT INTO doctors
    (name, hired, specialty)
VALUES
    ('Jenna', '2000-10-10', 'Oncology'),
    ('Max', '2000-10-10', 'Optomologist'),
    ('Christian', '2000-10-10', 'General');

INSERT INTO patients
    (name, social, birthdate)
VALUES
    ('Joan', 197552341, '1980-02-12'),
    ('Jim', 197352322, '1952-09-22'),
    ('Jaxon', 199512332, '1970-12-03');


INSERT INTO diseases
    (name, description)
VALUES
    ('none', 'none'),
    ('dermatitis', 'skin rash'),
    ('cataracs', 'eye issue'),
    ('melanoma', 'cancer');


INSERT INTO appointment
    (patient_id, doctor_id, prim_diagnosis, second_diagnosis, notes)
VALUES
    (1, 3, 2, 1, 'skin rash'),
    (2, 2, 3, 1, 'cataracs'),
    (1, 1, 4, 1, 'cancer');
