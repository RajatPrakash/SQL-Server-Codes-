--- while loop in procedure----

-- check whether procedure exists or not

if exists(select name from sys.procedures where name = 'pro_emp')
DROP PROCEDURE pro_emp
go
CREATE PROCEDURE pro_emp(@EmployeeIDMin INT, @EmployeeIDMax INT)
AS
BEGIN
	if exists (select * from employee where EmployeeID BETWEEN @EmployeeIDMin and @EmployeeIDMax )
		BEGIN
		DECLARE @EmployeeNumber INT  = @EmployeeIDMin
		while @EmployeeNumber <= @EmployeeIDMax
				BEGIN
				SELECT EmployeeID,EmployeeFirstName,EmployeeLastName,EmployeeGovernmentID 
				from employee
				where EmployeeID =@EmployeeNumber
				set @EmployeeNumber = @EmployeeNumber+1
				END
		END
	else
	select 'NO DATA For EmployeeID '--+convert(varchar(20),@EmployeeID) as 'EMPLOYEE DATA'
END  --Commands completed successfully.
go

exec pro_emp 323,327