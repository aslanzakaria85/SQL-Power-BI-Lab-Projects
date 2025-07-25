## What it does
This DAX measure calculates the number of workdays between the completion time of a sample and its pickup time, based on a custom Date table that flags workdays.

## Why it’s useful
In many real-world workflows (labs, logistics, etc.), weekends and holidays don’t count toward processing or turnaround times. This formula gives a more accurate, business-relevant view of sample turnaround time (TAT) by excluding non-working days.

You can use it to:

Track average workday-based turnaround

Benchmark performance by business week

Spot delays that occurred within vs. outside expected work periods


## How it works

StartDate pulls the earliest completion datetime for the group being evaluated.
EndDate pulls the latest pickup datetime for the group.
CALCULATE is used to count the number of rows in the DateTable between those two dates where IsWorkday = TRUE().

This assumes your DateTable includes:

A [Date] column (daily date values)
An [IsWorkday] column (Boolean TRUE/FALSE for business days)