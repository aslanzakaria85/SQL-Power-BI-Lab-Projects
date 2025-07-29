###Lab Data Questions:


-- Question 1: Which client has the highest number of late reports?

SELECT client_name, COUNT(*) AS late_reports
FROM lab1
WHERE reported > due_date
GROUP BY client_name
ORDER BY late_reports DESC
LIMIT 1


-- Question 2: Which test methods are used most often?

SELECT test_method, COUNT(*) AS usage_count
FROM lab1
GROUP BY test_method
ORDER BY usage_count DESC
LIMIT 10
 

-- Question 3: What's the TAT by test method? 

SELECT test_method, AVG(reported - received) AS avg_tat_days
FROM lab1
GROUP BY test_method
ORDER BY avg_tat_days DESC
LIMIT 12


-- Question 4: How many jobs were completed late? 

SELECT COUNT(*) AS late_jobs
FROM lab1
WHERE reported > due_date




-- Question 5: Which instrument is associated with the longest average TAT? 

SELECT inst, AVG(reported - received) AS avg_tat_days
FROM lab1
GROUP BY inst
ORDER BY avg_tat_days DESC
LIMIT 4


-- Question 6: How do average lab stage durations compare across rush vs. non-rush samples, and which stages most frequently exceed 24 hours?

WITH stage_durations AS (
  SELECT
    id,
    rush,
    EXTRACT(EPOCH FROM (prepared - received)) / 3600 AS prep_time,
    EXTRACT(EPOCH FROM (extracted - prepared)) / 3600 AS extract_time,
    EXTRACT(EPOCH FROM (analyzed - extracted)) / 3600 AS analyze_time,
    EXTRACT(EPOCH FROM (reported - analyzed)) / 3600 AS report_time
  FROM lab1
)

SELECT
  rush,
  ROUND(AVG(prep_time), 2) AS avg_prep,
  ROUND(AVG(extract_time), 2) AS avg_extract,
  ROUND(AVG(analyze_time), 2) AS avg_analyze,
  ROUND(AVG(report_time), 2) AS avg_report,
  SUM(CASE WHEN prep_time > 24 THEN 1 ELSE 0 END) AS prep_delays,
  SUM(CASE WHEN extract_time > 24 THEN 1 ELSE 0 END) AS extract_delays,
  SUM(CASE WHEN analyze_time > 24 THEN 1 ELSE 0 END) AS analyze_delays,
  SUM(CASE WHEN report_time > 24 THEN 1 ELSE 0 END) AS report_delays
FROM stage_durations
GROUP BY rush;

-- Question 7: How does the average turnaround time vary by business unit and rush status, and which combinations are the most efficient?

WITH avg_tat AS (
  SELECT 
    bu, 
    rush,
    AVG(EXTRACT(EPOCH FROM (reported - received)) / 3600) AS avg_turnaround_hours
  FROM lab1
  GROUP BY bu, rush
)
SELECT 
  bu, 
  rush, 
  ROUND(avg_turnaround_hours, 2) AS avg_turnaround_hours,
  RANK() OVER (ORDER BY avg_turnaround_hours) AS turnaround_rank
FROM avg_tat
ORDER BY turnaround_rank;


