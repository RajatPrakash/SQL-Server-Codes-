---check number of views existing on db----------------

select * from sys.views
go
-----lets alter the existing view ----------------------

alter view view_department as 
select D.deptname as 'Department Name',T.employeeid as 'Transaction Employee ID',t.DateOfTransaction As 'Date OF Transaction',
t.Amount as Amount
from dept D left join Employee E
on D.deptname = E.Department
left join tblTransaction T
on e.EmployeeID = t.EmployeeID
where t.EmployeeID between 120 and 500
-- order by t.EmployeeID
go



select * from view_department


--to drop a view we simply use the command ----
begin transaction

drop view view_department

rollback transaction

select * from sys.tables;