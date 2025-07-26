## What it does?
This DAX calculated column assigns each sample to a 2-hour drop-off window based on the time it was received (TimeDropped).

## Why it’s useful?
It helps visualize and analyze when samples are being dropped off during the day. This can support decisions around staffing, workload planning, or operational efficiency, especially in busy lab or office environments.

## How it works?
The SWITCH(TRUE(), …) pattern evaluates each condition in order. It checks whether the TimeDropped falls within a specific 2-hour interval and returns a text label for that time slot. If none match, it returns “other”.
