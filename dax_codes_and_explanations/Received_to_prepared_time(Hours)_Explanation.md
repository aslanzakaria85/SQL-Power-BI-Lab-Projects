## What it does?
This calculated column measures the number of hours it took from when a sample was received to when it was prepared. 


## Why it’s useful?
This time interval helps monitor how long it takes to move samples from intake to preparation. It can be used to:
- Identify delays in the preparation step
- Compare team or staff efficiency
- Spot workflow bottlenecks during busy periods


## How it works?
The DATEDIFF() function calculates the difference in hours between the 'Received(T)' and 'Prepared(T)' datetime columns for each row. Since it’s a calculated column, the value is stored row by row, allowing it to be aggregated or used in visuals and slicers. 