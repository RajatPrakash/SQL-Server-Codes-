use [Rajat 720_140]
go
-- check whether procedure exists or not

if exists(select name from sys.procedures where name = 'pro_emp')
DROP PROCEDURE pro_emp
go
CREATE PROCEDURE pro_emp(@EmployeeID INT)
AS
BEGIN
	if exists (select * from employee where EmployeeID = @EmployeeID)
		SELECT EmployeeID,EmployeeFirstName,EmployeeLastName,EmployeeGovernmentID 
		from employee
		where  employeeid = @EmployeeID
	else
		select 'NO DATA For EmployeeID '+convert(varchar(20),@EmployeeID) as 'EMPLOYEE DATA'
END  --Commands completed successfully.
go

exec pro_emp 123
exec pro_emp 111
exec pro_emp 222
