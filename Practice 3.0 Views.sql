use [rajat 720_140]
go

----------------------Creating a view ------------------------------
select top(5) * from employee
select top(5) * from tblTransaction
select top(5) * from dept

-- Name of the employee Of HR department whose amount > 200

select E.EmployeeFirstName,E.EmployeeLastName,T.amount,D.deptName
from employee E join dept D on
E.Department = D.deptname 
 join tblTransaction T on
t.EmployeeID = E.EmployeeID 
where t.Amount > 200 and D.deptname = 'HR'
go

-----------------Creating view ---------------------
Create View HR_Amount as
select E.EmployeeFirstName,E.EmployeeLastName,T.amount,D.deptName
from employee E join dept D on
E.Department = D.deptname 
 join tblTransaction T on
t.EmployeeID = E.EmployeeID 
where t.Amount > 200 and D.deptname = 'HR'
go
-- output : Commands completed successfully.


select * from HR_Amount

-----Deletion of row---------------
begin transaction

delete from HR_Amount 
where Amount = '210.87'

Rollback Transaction

---Output : HR_Amount' is not updatable because the modification affects MULTIPLE BASE TABLES.

-----Updation of row---------------
begin transaction

select * from HR_Amount 
where Amount = '210.87'

update  HR_Amount 
set Amount = '999.00'
where amount = '210.87'

select * from tblTransaction where  Amount = '999.00'  -- data has been updated on orignal table as well

select * from HR_Amount 
where Amount = '999.00'

Rollback Transaction
go

---Output : Successfully Completed.

----Securing the View So that No one can Alter or change the query :WITH ENCRYPTION ---------------------------------

Create View HR_Amount_Secured WITH ENCRYPTION as
select E.EmployeeFirstName,E.EmployeeLastName,T.amount,D.deptName
from employee E join dept D on
E.Department = D.deptname 
 join tblTransaction T on
t.EmployeeID = E.EmployeeID 
where t.Amount > 200 and D.deptname = 'HR'
go

------now only data can be access but no the view Query-------------------

select top(1) * from HR_Amount_Secured
go

