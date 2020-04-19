use [Rajat 720_140]
go

-----checkng whether procedure exists or not------

if exists(select * from sys.procedures where name = 'pro_emp')

drop procedure pro_emp
go

CREATE PROCEDURE pro_emp(@EmployeeID INT)
AS
BEGIN
	if exists (select * from employee where EmployeeID = @EmployeeID)
		BEGIN
		if @EmployeeID < 300			
			SELECT EmployeeID,EmployeeFirstName,EmployeeLastName,EmployeeGovernmentID 
			from employee
			where  employeeid = @EmployeeID			
		else
			
			Select e.EmployeeID,e.EmployeeFirstName,e.DateOfBirth,EmployeeGovernmentID,t.DateOfTransaction,t.Amount
			from employee as e join tblTransaction as t 
			on e.EmployeeID = @EmployeeID 
			and e.EmployeeID = t.employeeid
			--select * from tblTransaction where EmployeeID = @EmployeeID	
		END
	else
		select 'NO DATA For EmployeeID '+convert(varchar(20),@EmployeeID) as 'EMPLOYEE DATA'
END  --Commands completed successfully.
go


pro_emp 322

