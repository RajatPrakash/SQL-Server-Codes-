use [Rajat 720_140]
go

select top(1)* from dept
select top(1)* from employee
select top(1)* from tblTransaction



select D.deptname as 'Department Name',T.employeeid as 'Transaction Employee ID',t.DateOfTransaction As 'Date OF Transaction',
t.Amount as Amount
from dept D left join Employee E
on D.deptname = E.Department
left join tblTransaction T
on e.EmployeeID = t.EmployeeID
where t.EmployeeID between 120 and 139
order by t.EmployeeID
go
-----Creating a view For the above query-------------------
Create View view_department as 
select D.deptname as 'Department Name',T.employeeid as 'Transaction Employee ID',t.DateOfTransaction As 'Date OF Transaction',
t.Amount as Amount
from dept D left join Employee E
on D.deptname = E.Department
left join tblTransaction T
on e.EmployeeID = t.EmployeeID
where t.EmployeeID between 120 and 139
-- order by t.EmployeeID
go

/* to use order by in view we also need to 
specify TOP, OFFSET or FOR XML
then only we can add order by in view */

select * from view_department


















