## What it does?
This calculated column computes the number of hours a sample remained on the shelf — that is, the time between when the work was completed and when the sample was picked up.

## Why it’s useful?
This metric helps monitor and reduce sample handoff delays. Long shelf times can indicate process inefficiencies, poor communication, or staffing issues. By tracking this, teams can identify where workflows slow down after lab work is completed.

## How it works?
The DAX uses DATEDIFF to calculate the minute difference between CompletionDateTimeCS and PickupDateTimePC, then divides it by 60.0 to convert it into decimal hours.
The use of VAR improves readability and performance by storing the datetime values before the calculation.