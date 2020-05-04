use rajat_practice


--IMPLICIT TRANSACTION--

update tblEmployee
set EmployeeNumber = 122
where EmployeeNumber = 123


--Explicit Transaction 

BEGIN TRANSACTION

update tblEmployee
set EmployeeNumber = 123
where EmployeeNumber = 122

COMMIT TRANSACTION


select * from tblEmployee
