-- First Value Function 
-- Last  Value Function

use [Rajat 720_140]
go

-- first value 
select a.EmployeeID,a.AttendanceMonth,a.NumberAttendance,
first_value(a.NumberAttendance) 
over(partition by a.employeeID order by a.AttendanceMonth
rows between 2 preceding and current row) as lastmonth
from Attendance a join EMPLOYEE e 
on a.EmployeeID = e.EmployeeID


-- last value 
select a.EmployeeID,a.AttendanceMonth,a.NumberAttendance,
last_value(a.NumberAttendance) 
over(partition by a.employeeID order by a.AttendanceMonth
rows between 2 preceding and current row) as lastmonth
from Attendance a join EMPLOYEE e 
on a.EmployeeID = e.EmployeeID


select a.EmployeeID,a.AttendanceMonth,a.NumberAttendance,
last_value(a.NumberAttendance) 
over(partition by a.employeeID order by a.AttendanceMonth) as lastmonth -- with default range value unbounded preceding and current row
from Attendance a join EMPLOYEE e 
on a.EmployeeID = e.EmployeeID
--- then last_Value will be the current row