###Office Data Questions:

-- Question 1: How many tasks were completed each day?
	
SELECT CAST(completion_time AS DATE) AS task_date, COUNT(*) AS tasks_completed
FROM office1
GROUP BY CAST(completion_time AS DATE)
ORDER BY task_date
LIMIT 10

-- Question 2: How many tasks has each employee completed?

SELECT LOWER(pc), COUNT(*) AS tasks_completed
FROM office1
GROUP BY LOWER(pc)
ORDER BY tasks_completed DESC



-- Question 3: What’s the average time it takes to pick up a sample?

SELECT LOWER(pc), AVG((login_date + timepc) - completion_time) AS average_shelf_time
FROM office1
GROUP BY LOWER(PC)
ORDER BY average_shelf_time ASC

-- Question 4: How many rush jobs are being processed?

SELECT COUNT(*) AS rush_jobs_count
FROM office1
WHERE rush IS true 


-- Question 5: Do rush jobs take longer or shorter to complete?

SELECT rush, AVG(((login_date + timepc) - completion_time) / 60) AS avg_minutes_to_complete
FROM office1
GROUP BY rush



-- Question 6: Which office tasks exceeded 30 minutes to complete, and are there any patterns based on user, client, or time of day?

SELECT 
  name,
  client_name,
  id,
  start_time,
  completion_time,
  ROUND(EXTRACT(EPOCH FROM (completion_time - start_time)) / 60, 1) AS duration_minutes,
  CASE 
    WHEN EXTRACT(EPOCH FROM (completion_time - start_time)) / 60 > 30 THEN 'Delayed'
    ELSE 'On Time'
  END AS completion_status
FROM office
WHERE start_time BETWEEN '2025-05-01' AND '2025-05-31'
ORDER BY name, completion_status DESC, duration_minutes DESC;









