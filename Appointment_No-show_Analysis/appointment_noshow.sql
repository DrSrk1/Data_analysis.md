CREATE DATABASE noshow_db;
CREATE TABLE noshow_db.noshow_appointments (
    appointment_id BIGINT PRIMARY KEY,
    patient_id VARCHAR(255) NOT NULL,
    gender INT NOT NULL,
    scheduled_date DATE NOT NULL,
    appointment_date DATE NOT NULL,
    age INT NOT NULL,
    neighbourhood VARCHAR(255) NOT NULL,
    scholarship INT NOT NULL,
    hypertension INT NOT NULL,
    diabetes INT NOT NULL,
    alcoholism INT NOT NULL,
    handicap INT NOT NULL,
    sms_received INT NOT NULL,
    no_show INT NOT NULL,
    waiting_days INT NOT NULL
);
Use noshow_db;

Select * from noshow_cleaned_for_sql;
SELECT COUNT(*) FROM OPENROWSET(...);


#Table Checks before moving to PowerBi

SELECT COUNT(*) AS total_rows
FROM noshow_cleaned_for_sql;
-- 80 


