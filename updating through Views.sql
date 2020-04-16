--view Definition

Alter view secure_department   as 
select D.deptname as 'Department Name',T.employeeid as 'Transaction Employee ID',t.DateOfTransaction As 'Date OF Transaction',
t.Amount as Amount
from dept D left join Employee E
on D.deptname = E.Department
left join tblTransaction T
on e.EmployeeID = t.EmployeeID
where t.EmployeeID between 300 and 500
-- order by t.EmployeeID
go

--Retriving the duplicate records 
select [Transaction Employee ID], count(*)  as Total_Count from view_Department
group by [Transaction Employee ID]
having count(*) > 2
order by Total_Count desc

select  count(*) from view_department -- 841 Rows

----Updating the records via View - dbo.view_department
Begin Transaction

select  count(*) from view_department -- 841 Rows

update view_department
set [Transaction Employee ID] = 502
where [Transaction Employee ID] = 280

select  count(*) from view_department -- 834 Rows

select * from tblTransaction where EmployeeID = 280

select * from tblTransaction where EmployeeID = 502

Rollback transaction


select * from tblTransaction where EmployeeID = 280