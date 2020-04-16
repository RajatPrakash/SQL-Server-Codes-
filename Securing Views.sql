use [Rajat 720_140]
go


select * from sys.views

select * from sys.syscomments

--Retrivering the information of Exisitng views

select * from sys.syscomments as C 
inner join sys.views as V
on C.id = V.object_id

---Directly view the code of existing view

select OBJECT_DEFINITION(object_id('dbo.view_department'))
go

---------------Creating a Secure View so O=No one can change it -----------------

Create view secure_department  WITH ENCRYPTION as 
select D.deptname as 'Department Name',T.employeeid as 'Transaction Employee ID',t.DateOfTransaction As 'Date OF Transaction',
t.Amount as Amount
from dept D left join Employee E
on D.deptname = E.Department
left join tblTransaction T
on e.EmployeeID = t.EmployeeID
where t.EmployeeID between 300 and 500
-- order by t.EmployeeID
go

--Retrivering the information of Exisitng views

select * from sys.syscomments as C 
inner join sys.views as V
on C.id = V.object_id

/*
OUTPUT:
text
NULL
*/
--Data Can be access through view and view cannot be change 
Select * from secure_department

