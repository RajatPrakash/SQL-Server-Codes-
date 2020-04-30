use [Rajat 720_140]
go

--delete  EMPLOYEE  where employeeID = 1

BEGIN TRANSACTION

ALTER TABLE employee
ADD ManagerID INT 
go

UPDATE employee 
SET ManagerID = ((EmployeeID -123)/10)+123
WHERE employeeID > 123
go




----Performing inner join

select e.EmployeeID,e.EmployeeFirstName,e.EmployeeLastName,
	   m.ManagerID, m.EmployeeFirstName,m.EmployeeLastName
from EMPLOYEE e join employee m
on e.ManagerID = m.EmployeeID

ROLLBACK TRANSACTION


