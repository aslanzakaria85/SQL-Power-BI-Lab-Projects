###Lab Data Questions:




-- Question 2: Which client has the highest number of late reports?

SELECT client_name, COUNT(*) AS late_reports
FROM lab1
WHERE reported > due_date
GROUP BY client_name
ORDER BY late_reports DESC
LIMIT 1


-- Question 3: Which test methods are used most often?

SELECT test_method, COUNT(*) AS usage_count
FROM lab1
GROUP BY test_method
ORDER BY usage_count DESC
LIMIT 10
 

-- Question 4: What's the TAT by test method? 

SELECT test_method, AVG(reported - received) AS avg_tat_days
FROM lab1
GROUP BY test_method
ORDER BY avg_tat_days DESC
LIMIT 12


-- Question 5: How many jobs were completed late? 

SELECT COUNT(*) AS late_jobs
FROM lab1
WHERE reported > due_date




-- Question 8: Which instrument is associated with the longest average TAT? 

SELECT inst, AVG(reported - received) AS avg_tat_days
FROM lab1
GROUP BY inst
ORDER BY avg_tat_days DESC
LIMIT 4


