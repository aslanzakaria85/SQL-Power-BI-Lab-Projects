###Lab Data Questions:

-- Question 1: What is the average TAT for all folders? 

SELECT AVG(reported - received) AS avg_tat_days
FROM lab1


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


-- Question 6: What is the average delay for late jobs? 

SELECT AVG(reported - due_date) AS avg_delay_days
FROM lab1
WHERE reported > due_date


-- Question 7: What's the weekly trend of the number of folders received?\

SELECT DATE_TRUNC('week', received) AS week_start, COUNT(*) AS num_folders
FROM lab1
GROUP BY week_start
ORDER BY week_start


-- Question 8: Which instrument is associated with the longest average TAT? 

SELECT inst, AVG(reported - received) AS avg_tat_days
FROM lab1
GROUP BY inst
ORDER BY avg_tat_days DESC
LIMIT 4


-- Question 9: Who reports the most folders?

SELECT reported_by, COUNT(*) AS report_count
FROM lab1
GROUP BY reported_by
ORDER BY report_count DESC
LIMIT 1
