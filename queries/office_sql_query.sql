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


-- Question 3: How has task volume trended over time(weekly)?

SELECT DATE_TRUNC('week', completion_time) AS week_start,
COUNT(*) AS tasks_complete
FROM office1
GROUP BY week_start
ORDER BY week_start


-- Question 4: What’s the average time it takes to pick up a sample?

SELECT LOWER(pc), AVG((login_date + timepc) - completion_time) AS average_shelf_time
FROM office1
GROUP BY LOWER(PC)
ORDER BY average_shelf_time ASC

-- Question 5: How many rush jobs are being processed?

SELECT COUNT(*) AS rush_jobs_count
FROM office1
WHERE rush IS true 


-- Question 6: Do rush jobs take longer or shorter to complete?

SELECT rush, AVG(((login_date + timepc) - completion_time) / 60) AS avg_minutes_to_complete
FROM office1
GROUP BY rush


-- Question 7: Which clients submit the most rush requests?

SELECT client_name, COUNT(*) AS rush_job_count
FROM office1
WHERE rush IS TRUE
GROUP BY client_name
ORDER BY rush_job_count DESC
LIMIT 8






