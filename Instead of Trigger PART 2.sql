
-----More Advance Trigger , Deleting rows from view Using trigger ------------


Select top(1)* from view_department
go

Select top(1)* from tblTransaction
go


CREATE TRIGGER tr_view_delete
on view_department
instead of delete
AS BEGIN
SET NOCOUNT ON
	DECLARE @EMPLOYEEID int
	DECLARE @TransactionDate SMALLDATETIME
	DECLARE @Amount SMALLMONEY

	select @EMPLOYEEID = [Transaction Employee ID],@TransactionDate = [Date OF Transaction], @Amount = Amount
	from deleted

	delete from tblTransaction 
	where EmployeeID = @EMPLOYEEID 
	and DateOfTransaction = @TransactionDate
	and Amount = @Amount
	
END

BEGIN TRANSACTION

select * from tblTransaction
where Amount = -2.77 and EmployeeID = 132

delete from view_department
where Amount = -2.77 and [Transaction Employee ID] = 132

select * from tblTransaction
where Amount = -2.77 and EmployeeID = 132

ROLLBACK TRANSACTION
go 

select * from tblTransaction
where Amount = -2.77 and EmployeeID = 132


