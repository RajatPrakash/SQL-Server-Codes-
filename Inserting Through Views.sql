--- Adding new Rows throught VIEWS


begin transaction

insert into [dbo].[view_department]([Transaction Employee ID],[Date OF Transaction],Amount) values (133,'2020-04-16',999.99)

select * from view_department 
order by [Date OF Transaction] desc 

---Checking whether data is inserted into original table

select * from tblTransaction where amount = 999.99

RollBack Transaction
go

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

select * from dept