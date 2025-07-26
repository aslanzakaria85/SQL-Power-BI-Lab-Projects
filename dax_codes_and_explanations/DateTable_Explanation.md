## What it does
This DAX expression creates a custom Date Table with important information, including flags for weekends, holidays, and workdays. It also includes columns for year, month, and formatted time periods to support filtering and time-based analysis. 

## Why it’s useful?
A Date Table is essential for accurate time-based reporting in Power BI. This one allows you to:
- Filter reports to show only workdays
- Exclude holidays and weekends in turnaround time (TAT) calculations
- Build clear time hierarchies (Month, YearMonth, etc.)
- Sort visuals properly using YearMonthSort


This makes your reports much better, especially when measuring operational metrics like delays or service time. 


## How it works?
- HolidayList is a manually defined list of known holidays.
- CALENDAR generates all dates between Jan 1, 2022 and Dec 31, 2025.
- ADDCOLUMNS enriches each date with:
    - IsWeekend: Checks if the date is Saturday or Sunday
    - IsHoliday: Flags any date matching the holiday list
    - IsWorkday: Returns TRUE only if it's not a weekend or a holiday
    - Additional columns: Year, Month, and formatted date strings for reporting

