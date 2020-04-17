USE [Rajat 720_140]
GO

----------------------First Trigger Created on Table Transaction--------------------------------
Create Trigger TR_tblTransaction 
on tblTransaction
after delete,insert,update
AS BEGIN
	select * from inserted
	select * from deleted
END   --- output : Commands completed successfully.
go


----------------------Second  Trigger Created on View  [view_department]--------------------------------

CREATE TRIGGER [dbo].[tr_view_delete]
on [dbo].[view_department]
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
GO

insert into tblTransaction values(111,'2020-01-01',111.99) --- first trigger is called :TR_tblTransaction


-----When we run the below query both triggers are called One Because Query is calling view and view is calling table
BEGIN TRANSACTION

select * from tblTransaction where Amount = -2.77 and EmployeeID = 132

delete from view_department
where Amount = -2.77 and [Transaction Employee ID] = 132

select * from tblTransaction where Amount = -2.77 and EmployeeID = 132

ROLLBACK TRANSACTION
go

--- Check Number of levels are there in a trigger


----------------------Altering First Trigger--------------------------------
Alter Trigger TR_tblTransaction 
on tblTransaction
after delete,insert,update
AS BEGIN
	select @@NESTLEVEL AS 'NEST LEVEL'    --- checking the depth of trigger 
	select * from inserted
	select * from deleted
END   --- output : Commands completed successfully.
go

BEGIN TRANSACTION

insert into tblTransaction values(333,'2020-01-01',222.99) --- first trigger is called :TR_tblTransaction along with its dept

ROLLBACK TRANSACTION

/*
OUTPUT:
NEST LEVEL
1
*/
go

----------------------Altering Second  Trigger Created on View  [view_department]--------------------------------

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
	select @@NESTLEVEL as 'NEST LEVEL'
	delete from tblTransaction 
	where EmployeeID = @EMPLOYEEID 
	and DateOfTransaction = @TransactionDate
	and Amount = @Amount
	
END
GO


-----When we run the below query both triggers are called One Because Query is calling view and view is calling table
BEGIN TRANSACTION

select * from tblTransaction where Amount = -2.77 and EmployeeID = 132

delete from view_department
where Amount = -2.77 and [Transaction Employee ID] = 132

select * from tblTransaction where Amount = -2.77 and EmployeeID = 132

ROLLBACK TRANSACTION
go

----so IF NEST LEVEL is greater than 1 than I only want to call 1 trigger i:e Trigger Created on View  [view_department] ----------

--- so we will alter the table trigger ------
----------------------Altering First Trigger--------------------------------
Alter Trigger TR_tblTransaction 
on tblTransaction
after delete,insert,update
AS BEGIN
	if  @@NESTLEVEL = 1
	BEGIN
		select * from inserted
		select * from deleted
	END
END   --- output : Commands completed successfully.
go

BEGIN TRANSACTION

select * from tblTransaction where Amount = -2.77 and EmployeeID = 132

delete from view_department
where Amount = -2.77 and [Transaction Employee ID] = 132

select * from tblTransaction where Amount = -2.77 and EmployeeID = 132

ROLLBACK TRANSACTION