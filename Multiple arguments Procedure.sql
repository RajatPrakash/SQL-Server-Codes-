-- check whether procedure exists or not

if exists(select name from sys.procedures where name = 'pro_emp')
DROP PROCEDURE pro_emp
go
CREATE PROCEDURE pro_emp(@EmployeeIDMin INT, @EmployeeIDMax INT)
AS
BEGIN
	if exists (select * from employee where EmployeeID BETWEEN @EmployeeIDMin and @EmployeeIDMax )
		SELECT EmployeeID,EmployeeFirstName,EmployeeLastName,EmployeeGovernmentID 
		from employee
		where EmployeeID BETWEEN @EmployeeIDMin and @EmployeeIDMax
	else
		select 'NO DATA For EmployeeID '--+convert(varchar(20),@EmployeeID) as 'EMPLOYEE DATA'
END  --Commands completed successfully.
go

pro_emp 4,5

pro_emp 223,227

pro_emp @EmployeeIDMin = 323,@EmployeeIDMax = 327
