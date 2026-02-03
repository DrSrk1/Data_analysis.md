CREATE DATABASE health_db;

USE health_db;
DROP TABLE IF EXISTS patient_risk_master;
CREATE TABLE patient_risk_master (
    patient_id INT PRIMARY KEY,
    age INT,
    gender INT,
    race_ethnicity INT,
    income_ratio FLOAT,
    obesity_flag TINYINT,
    hypertensive_flag TINYINT,
    smoker_flag TINYINT,
    physically_inactive_flag TINYINT,
    risk_score INT,
    risk_category VARCHAR(10)
);


Select *
from patient_risk_master;

-- total patients
SELECT COUNT(*) FROM patient_risk_master;

-- key flags
SELECT 
    SUM(obesity_flag) AS obesity,
    SUM(hypertensive_flag) AS hypertensive,
    SUM(smoker_flag) AS smoker,
    SUM(physically_inactive_flag) AS inactive
FROM patient_risk_master;

-- risk category split
SELECT risk_category, COUNT(*) 
FROM patient_risk_master
GROUP BY risk_category;

-- Risk Distribution
SELECT risk_category, COUNT(*) AS patients
FROM patient_risk_master
GROUP BY risk_category;

-- Risk by age group 
SELECT 
    CASE 
        WHEN age < 18 THEN 'Child'
        WHEN age BETWEEN 18 AND 39 THEN 'Young Adult'
        WHEN age BETWEEN 40 AND 64 THEN 'Middle Age'
        ELSE 'Senior'
    END AS age_group,
    COUNT(*) AS patients,
    AVG(risk_score) AS avg_risk_score
FROM patient_risk_master
GROUP BY age_group;


-- hypertension prevelance 
SELECT 
    hypertensive_flag,
    COUNT(*) AS patients
FROM patient_risk_master
GROUP BY hypertensive_flag;

-- multiple risk factors 
SELECT risk_score, COUNT(*) AS patients
FROM patient_risk_master
GROUP BY risk_score
ORDER BY risk_score;

-- Create sql views
CREATE VIEW risk_summary AS
SELECT
    risk_category,
    COUNT(*) AS patient_count,
    AVG(risk_score) AS avg_risk_score
FROM patient_risk_master
GROUP BY risk_category;

SELECT * FROM risk_summary;

-- Python was used to engineer clinical risk indicators.
-- SQL was used to validate results, aggregate population-level metrics, and serve clean analytical views to Power BI.