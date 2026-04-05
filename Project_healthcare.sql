SELECT num_procedures, COUNT(*) AS procedure_count
FROM healthcare.diabetic_data
GROUP BY num_procedures
ORDER BY num_procedures DESC
LIMIT 10;

SELECT age, COUNT(*) AS patient_count
FROM healthcare.diabetic_data
GROUP BY age
ORDER BY age;

SELECT
    COUNT(*) AS readmitted_count,
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM healthcare.diabetic_data)) AS readmitted_percentage
FROM healthcare.diabetic_data
WHERE readmitted != 'No';

SELECT admission_type_id, AVG(time_in_hospital) AS avg_length_of_stay
FROM healthcare.diabetic_data
GROUP BY admission_type_id;

SELECT diag_1, COUNT(*) AS diagnosis_count
FROM healthcare.diabetic_data
GROUP BY diag_1
ORDER BY diagnosis_count DESC
LIMIT 10;

SELECT COUNT(DISTINCT encounter_id) AS total_encounters
FROM healthcare.diabetic_data;

SELECT payer_code,
    COUNT(CASE WHEN readmitted != 'No' THEN 1 END) AS readmitted_count,
    COUNT(*) AS total_encounters,
    (COUNT(CASE WHEN readmitted != 'No' THEN 1 END) * 100.0 / COUNT(*)) AS readmission_rate_percentage
FROM healthcare.diabetic_data
GROUP BY payer_code
ORDER BY readmission_rate_percentage DESC;

SELECT age, AVG(num_medications) AS avg_medications
FROM healthcare.diabetic_data
GROUP BY age
ORDER BY age;