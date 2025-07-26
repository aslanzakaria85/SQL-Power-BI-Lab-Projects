## What it does?
This calculated column classifies each sample as either "On Time" or "Delayed" based on how long it sat on the shelf. If the shelf time is under or equal to 24 hours, it's considered on time.

## Why it’s useful?
It gives a simple, visual way to monitor compliance with sample pickup expectations. This makes it easy to flag delayed jobs, track patterns, and report performance KPIs without showing raw shelf time everywhere.

## How it works?
The function uses a basic IF statement:
If ShelfTimeHours is equal to or less than 24, return "On Time"
Otherwise, return "Delayed"
This classification is useful for conditional formatting, filtering, or grouping.
