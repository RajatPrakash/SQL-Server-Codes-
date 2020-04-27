use [Rajat 720_140]
go


--------------ROW NUMBER---------------------------------------
select a.EmployeeID,a.AttendanceMonth,a.NumberAttendance,
row_number() over(partition by a.EmployeeID order by a.EmployeeID,a.AttendanceMonth )as 'Row Number'  --'row_number' must have an OVER clause.
from employee as e inner join Attendance as a
on e.EmployeeID = a.EmployeeID	
go

--special condtion : when you don't want to use order by

select a.EmployeeID,a.AttendanceMonth,a.NumberAttendance,
row_number() over(order by (select null) )as 'Row Number'
from employee as e inner join Attendance as a
on e.EmployeeID = a.EmployeeID	  -- we can run row number () with order by also

-------------------RANK FUNCTION --------------------------------
/*
when tie happens,
Rank would actually skip when using the RANK() 
function leading to non-consecutive ranks.
*/

select a.EmployeeID,a.AttendanceMonth,a.NumberAttendance,
row_number() over(partition by a.EmployeeID order by a.EmployeeID,a.AttendanceMonth )as 'Row Number',  --'row_number' must have an OVER clause.
rank() over(partition by a.EmployeeID order by a.EmployeeID,a.AttendanceMonth )as 'Rank'
from employee as e join (select * from attendance union all select * from attendance) as a
on e.EmployeeID = a.EmployeeID	
go

-------------------DENCE RANK FUNCTION --------------------------------
/*
when tie happens,With the DENSE_RANK() function,
then none of the ranks will be skipped. 
This means that the ranks will remain in consecutive order.
*/

select a.EmployeeID,a.AttendanceMonth,a.NumberAttendance,
row_number() over(partition by a.EmployeeID order by a.EmployeeID,a.AttendanceMonth )as 'Row Number',  --'row_number' must have an OVER clause.
dense_rank() over(partition by a.EmployeeID order by a.EmployeeID,a.AttendanceMonth )as 'DENSE Rank'
from employee as e join (select * from attendance union all select * from attendance) as a
on e.EmployeeID = a.EmployeeID	
