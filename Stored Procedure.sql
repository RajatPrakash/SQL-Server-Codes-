CREATE PROCEDURE pro_emp as
BEGIN
	SELECT EmployeeID,EmployeeFirstName,EmployeeLastName,EmployeeGovernmentID from employee
END  --Commands completed successfully.
go

--directly call procedure 
pro_emp

--Using EXECUTE
Exec pro_emp