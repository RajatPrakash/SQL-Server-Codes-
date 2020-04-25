use [Rajat 720_140]


select a.EmployeeID,CONCAT(e.EmployeeFirstName,' ',e.EmployeeLastName) as FULLNAME,e.Department,a.AttendanceMonth,a.NumberAttendance from employee e join Attendance a 
on
e.EmployeeID = a.EmployeeID
order by e.Department