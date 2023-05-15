CREATE DATABASE NK01;

USE NK01;

DROP TABLE if exists PATIENT;
CREATE TABLE PATIENT (
  ID INT PRIMARY KEY,
  NAME VARCHAR(255),
  DateOfBirth DATE
);

INSERT INTO PATIENT VALUES
	(1, 'Alice', '1992-10-13'),
	(2, 'Bob', '1997-08-25'),
	(3, 'Robert', '1987-06-15'),
	(4, 'Rachel', '1995-01-18');

DROP TABLE if exists DOCTOR;
CREATE TABLE DOCTOR (
ID INT PRIMARY KEY, 
NAME VARCHAR(255),
Employee_Type CHAR(20)
);

INSERT INTO DOCTOR VALUES
	(10, 'David','Contract'),
    (11, 'Tony','Permanent'),
    (12, 'Elena','Permanent'),
    (14, 'Feona','Contract'),
    (17, 'Eden','Permanent');

# Create table TREATMENT to store PatientID as PID and DoctorID as DID
DROP TABLE if exists TREATMENT;
CREATE TABLE TREATMENT (
	PID INT,  
    DID INT , 
    PRIMARY KEY (PID,DID));
    
INSERT INTO TREATMENT VALUES
	(1, 10),
    (2, 12),
    (3, 17),
    (4, 11);

# Get all patient's names and date of birth
SELECT NAME, DateOfBirth
FROM PATIENT;

# Retrieve the names of all doctors in the DOCTOR table who have a permanent employee type
SELECT NAME
FROM DOCTOR
WHERE Employee_Type='Permanent'
ORDER BY NAME;

# Retrieve the names of all patients in the PATIENT table
	# who have received treatment from a doctor with a permanent employee type
SELECT P.NAME
FROM PATIENT P
JOIN TREATMENT T ON P.ID=T.PID
JOIN DOCTOR D ON D.ID=T.DID
WHERE D.Employee_Type='Contract';

# Count the number of treatments that each doctor has performed
SELECT D.Name, count(*) AS NumTreats
FROM TREATMENT T
JOIN DOCTOR D ON T.DID=D.ID
GROUP BY T.DID;

# Update Patient Alice birth date to 1990-05-15
UPDATE PATIENT
SET DateOfBirth = '1990-05-15'
WHERE NAME='Alice';

# Add new patient name Moris, 1993-03-27, treated by doctor Elena DID = 12
INSERT INTO PATIENT VALUES(5,'Moris','1993-03-27');
INSERT INTO TREATMENT VALUES(5,12);

# Modify PATIENT and DOCTOR NAME column type to VARCHAR(260)
ALTER TABLE PATIENT MODIFY COLUMN NAME VARCHAR(260);
ALTER TABLE DOCTOR MODIFY COLUMN NAME VARCHAR(260);