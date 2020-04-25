
select e.EmployeeID,a.AttendanceMonth,a.NumberAttendance,
sum(a.NumberAttendance) over(partition by a.employeeid,
year(a.AttendanceMonth) order by a.AttendanceMonth
rows between unbounded preceding and 0 following) as total
from employee e join attendance a
on e.EmployeeID = a.EmployeeID
--where a.AttendanceMonth < '20150101'
--order by e.EmployeeID,a.AttendanceMonth
go

--or reverse of it 

select e.EmployeeID,a.AttendanceMonth,a.NumberAttendance,
sum(a.NumberAttendance) over(partition by a.employeeid,
year(a.AttendanceMonth) order by a.AttendanceMonth
rows between 0 preceding and unbounded following) as total
from employee e join attendance a
on e.EmployeeID = a.EmployeeID
--where a.AttendanceMonth < '20150101'
--order by e.EmployeeID,a.AttendanceMonth