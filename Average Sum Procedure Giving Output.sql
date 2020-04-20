-- check whether procedure exists or not

if exists(select name from sys.procedures where name = 'p_Average_Balance')
DROP PROCEDURE p_Average_Balance
go
CREATE PROCEDURE p_Average_Balance(@EmployeeIDMin INT, @EmployeeIDMax INT,@AverageBalance int OUTPUT)
AS
BEGIN
	DECLARE @TotalSum int,@TotalCount int
	--set @AverageBalance = 0
	select @TotalSum = sum(amount) from tblTransaction
	where EmployeeID BETWEEN @EmployeeIDMin and @EmployeeIDMax
	
	select @TotalCount = count(DISTINCT EMPLOYEEID) from EMPLOYEE 
	where EmployeeID BETWEEN @EmployeeIDMin and @EmployeeIDMax

	set @AverageBalance = @TotalSum / @TotalCount


end  --Commands completed successfully.
go





DECLARE @Average int, @returnstatus int
execute @returnstatus = p_Average_Balance 223,227, @Average OUTPUT
select @Average As AVERAGE,@returnstatus as ReturnStatus  --786
go

DECLARE @Average int, @returnstatus int
execute @returnstatus = p_Average_Balance 4,5, @Average OUTPUT
select @Average As AVERAGE,@returnstatus as ReturnStatus-- Divide by zero error encountered. Will Cover in try catch or can be solved using if else statement also

DECLARE @Average int
select @Average=sum(amount) from tblTransaction
where EmployeeID BETWEEN 223 and 227
--select @Average
	
DECLARE @Average1 int
select @Average1 = count(DISTINCT EMPLOYEEID) from EMPLOYEE 
where EmployeeID BETWEEN 223 and 227
--select @Average1

declare @Test int
set @Test = @Average/@Average1
select @Test
 