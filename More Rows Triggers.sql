--- Creating or altering a trigger that can handle more than one row---------------


ALTER TRIGGER [dbo].[tr_view_delete]
on [dbo].[view_department]
instead of delete
AS BEGIN
SET NOCOUNT ON
	DECLARE @EMPLOYEEID int
	DECLARE @TransactionDate SMALLDATETIME
	DECLARE @Amount SMALLMONEY

	select @EMPLOYEEID = [Transaction Employee ID],@TransactionDate = [Date OF Transaction], @Amount = Amount
	from deleted
	--select @@NESTLEVEL as 'NEST LEVEL'
	delete from tblTransaction 
	where EmployeeID = @EMPLOYEEID 
	and DateOfTransaction = @TransactionDate
	and Amount = @Amount
	
END


BEGIN TRANSACTION 

select *,'BEFORE DELETION' from view_department where [Transaction Employee ID] = 132

delete from view_department 
where [Transaction Employee ID] = 132

select *,'AFTER DELETION' from view_department where [Transaction Employee ID] = 132

ROLLBACK TRANSACTION  -- only last row is deleted not all 5
go


select top(1) * from tblTransaction
go

----To make trigger that can handle more rows at one-------------
ALTER TRIGGER tr_view_delete
on view_department
instead of delete
AS BEGIN
--SET NOCOUNT ON
	select *,'To be Deleted' from deleted
	delete from tblTransaction as T join deleted D 
	on	T.EmployeeID = D.[Transaction Employee ID]
	and T.DateofTransaction = D.[Date OF Transaction]gi		
	and T.Amount = D.Amount
END


BEGIN TRANSACTION 

select *,'BEFORE DELETION' from view_department where [Transaction Employee ID] = 132

delete from view_department 
where [Transaction Employee ID] = 132

select *,'AFTER DELETION' from view_department where [Transaction Employee ID] = 132

ROLLBACK TRANSACTION  -- only last row is deleted not all 5
go