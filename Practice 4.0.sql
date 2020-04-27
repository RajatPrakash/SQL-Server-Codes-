select * from Attendance


--- Trying to find the running attendace of each employee for the year 2014 only -------------------------------

select employeeid,NumberAttendance,AttendanceMonth,
sum(NumberAttendance) over(partition by employeeid order by AttendanceMonth) as 'Running Attandence'
from Attendance
where AttendanceMonth < '20150101'