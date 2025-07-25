## What it does?
This measure calculates the average turnaround time (TAT) for all lab jobs, based on the time between when each sample was received and when the report was submitted. 


## Why it’s useful?
It provides a high-level performance indicator for the entire lab. By tracking this average over time or across departments, the team can monitor service consistency, identify process slowdowns, and meet reporting targets. 

## How it works?
The AVERAGE() function takes the values from the [Recieved_to_submisson_time] column — which likely contains the TAT in hours or days — and returns the mean across all rows in the filtered context. Because it's a measure, the result will dynamically update based on slicers (e.g., client, method, staff, date). This calculated column measures the number of hours it took from when a sample was received to when it was prepared for analysis.
