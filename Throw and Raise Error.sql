------------------------------------------------WORKING WITH THROW--------------------------------------------------------
-- check whether procedure exists or not

if exists(select name from sys.procedures where name = 'p_Average_Balance')
DROP PROCEDURE p_Average_Balance
go
CREATE PROCEDURE p_Average_Balance(@EmployeeIDMin INT, @EmployeeIDMax INT,@AverageBalance int OUTPUT)
AS
BEGIN
	DECLARE @TotalSum int,@TotalCount int, @returnstatus int
	BEGIN TRY
		select @TotalSum = sum(amount) from tblTransaction
		where EmployeeID BETWEEN @EmployeeIDMin and @EmployeeIDMax
	
		select @TotalCount = count(DISTINCT EMPLOYEEID) from EMPLOYEE 
		where EmployeeID BETWEEN @EmployeeIDMin and @EmployeeIDMax

		set @AverageBalance = @TotalSum / @TotalCount
		RETURN 0
	END TRY
	BEGIN CATCH
		THROW 8899225,'DUMUS ERROR ' ,2  -- THROW error number , error message , error state
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
--output : DUMUS ERROR 

select EMPLOYEEID from tblTransaction where Amount > 999




------------------------------------------------WORKING WITH RAISE ERROR--------------------------------------------------------
-- check whether procedure exists or not

if exists(select name from sys.procedures where name = 'p_Average_Balance')
DROP PROCEDURE p_Average_Balance
go
CREATE PROCEDURE p_Average_Balance(@EmployeeIDMin INT, @EmployeeIDMax INT,@AverageBalance int OUTPUT)
AS
BEGIN
	DECLARE @TotalSum int,@TotalCount int, @returnstatus int
	BEGIN TRY
		select @TotalSum = sum(amount) from tblTransaction
		where EmployeeID BETWEEN @EmployeeIDMin and @EmployeeIDMax
	
		select @TotalCount = count(DISTINCT EMPLOYEEID) from EMPLOYEE 
		where EmployeeID BETWEEN @EmployeeIDMin and @EmployeeIDMax

		set @AverageBalance = @TotalSum / @TotalCount
		RETURN 0
	END TRY
	BEGIN CATCH
		raiserror('THIS IS THE RAISE ERROR MESSAGE',16,1) --raiserror : Error Message,Error Severity, STATE
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
--output : THIS IS THE RAISE ERROR MESSAGE

select EMPLOYEEID from tblTransaction where Amount > 999