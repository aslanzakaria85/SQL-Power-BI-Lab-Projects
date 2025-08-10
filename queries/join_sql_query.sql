-- Question 1: Which non-rush jobs have lab results, and which ones are still pending?

SELECT 
    office.id AS office_id,
    office.name AS analyst_name,
    office.client_name,
    office.folder_num,
    lab1.id AS lab_id,
    lab1.test_method,
    lab1.analyzed,
    lab1.reported
FROM 
    office
LEFT JOIN 
    lab1
    ON office.client_name = lab1.client_name
WHERE 
    office.rush IS NULL
ORDER BY 
    office.login_date DESC;