use [Rajat 720_140]


select a.EmployeeID,CONCAT(e.EmployeeFirstName,' ',e.EmployeeLastName) as FULLNAME,e.Department,a.AttendanceMonth,a.NumberAttendance from employee e join Attendance a 
on
e.EmployeeID = a.EmployeeID
order by e.Department


select e.EmployeeID,year(a.AttendanceMonth) as Year,sum(a.NumberAttendance) as attendance from employee e join attendance a
on 
e.EmployeeID = a.EmployeeID
group by e.EmployeeID,a.AttendanceMonth
order by e.EmployeeID,Year


-------------------over -----------------------------

select e.EmployeeID,a.AttendanceMonth,a.NumberAttendance,
sum(a.NumberAttendance) over()  as total  --35409 total sum(a.NumberAttendance)
from employee e join Attendance a
on a.EmployeeID = e.EmployeeID
where a.AttendanceMonth < '20150101'




-----------------over partition by --------------------------
--partition define the range from where to where it has to work

select e.EmployeeID,a.AttendanceMonth,a.NumberAttendance,
sum(a.NumberAttendance) over(partition by e.employeeID)  as total  --sum(a.NumberAttendance) employeewise .
from employee e join Attendance a
on a.EmployeeID = e.EmployeeID
where a.AttendanceMonth < '20150101'
-- group by e.EmployeeID,a.AttendanceMonth





--------OVER Partition By along with order by---------------------------
--------this will give the running total in orderly fashion



--------OVER Partition By along with order by, with range ---------------------------

select e.EmployeeID,a.AttendanceMonth,a.NumberAttendance,
sum(a.NumberAttendance) over(partition by a.employeeid,
year(a.AttendanceMonth) order by a.AttendanceMonth
rows between 1 preceding and 1 following) as total
from employee e join attendance a
on e.EmployeeID = a.EmployeeID
--where a.AttendanceMonth < '20150101'
--order by e.EmployeeID,a.AttendanceMonth






