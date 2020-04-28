--- generating  a list of numbers-------------

select * from EMPLOYEE where EmployeeID not in (select EmployeeID from tblTransaction)


select * from tblTransaction where EMPLOYEEID = 130
select * from EMPLOYEE where EMPLOYEEID = 2
select EmployeeID from tblTransaction order by EmployeeID
go

with WrongEmployee as(
select Distinct EmployeeID 
from tblTransaction where EmployeeID 
not in (select EmployeeID from EMPLOYEE) 
)
select w.* from WrongEmployee w left join tblTransaction t
on w.EmployeeID = t.EmployeeID and 
t.EmployeeID is null
--where EmployeeID not in (select EmployeeID from tblTransaction)





select * from dbo.Employee
 go
with myTable as
(Select Amount, DateOfTransaction
from dbo.tblTransaction)
select *
from myTable