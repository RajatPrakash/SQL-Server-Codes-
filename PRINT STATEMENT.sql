--Print statment can be very helpful in debugging the code
-- check whether procedure exists or not

if exists(select name from sys.procedures where name = 'p_Average_Balance')
DROP PROCEDURE p_Average_Balance
go
CREATE PROCEDURE p_Average_Balance(@EmployeeIDMin INT, @EmployeeIDMax INT,@AverageBalance int OUTPUT)
AS
BEGIN
	DECLARE @TotalSum int,@TotalCount int, @returnstatus int
	BEGIN TRY
		print 'Employee ID starts from ' + convert(varchar(10),@EmployeeIDMin)+ ' to '+convert(varchar(10),@EmployeeIDMax)
		select @TotalSum = sum(amount) from tblTransaction
		where EmployeeID BETWEEN @EmployeeIDMin and @EmployeeIDMax
	
		select @TotalCount = count(DISTINCT EMPLOYEEID) from EMPLOYEE 
		where EmployeeID BETWEEN @EmployeeIDMin and @EmployeeIDMax

		set @AverageBalance = @TotalSum / @TotalCount
		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE @Raise varchar(250)
		select @Raise = ERROR_MESSAGE()
		raiserror(@Raise,16,1) --raiserror : Error Message,Error Severity, STATE
	END CATCH

end  --Commands completed successfully.
go

DECLARE @Average int, @returnstatus int
execute @returnstatus = p_Average_Balance 223,227, @Average OUTPUT
select @Average As AVERAGE,@returnstatus as ReturnStatus --- NORMAL CASE TRY BLOCK EXECUTED 
go

DECLARE @Average int, @returnstatus int
execute @returnstatus = p_Average_Balance 4,5, @Average OUTPUT
select @Average As AVERAGE,@returnstatus as ReturnStatus  -- CATCH BLOCK EXECUTED
--output : Msg 50000 Divide by zero error encountered., 50000 is custom error message number

select EMPLOYEEID from tblTransaction where