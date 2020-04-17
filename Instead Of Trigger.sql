
CREATE trigger tr_view
on [dbo].[view_department]
INSTEAD OF DELETE
as BEGIN

SET NOCOUNT ON

select *,'view_department' from deleted

END --output : Commands completed successfully.


BEGIN TRANSACTION 

delete from view_department
where Amount = -2.77 and [Transaction Employee ID] = 132

ROLLBACK TRANSACTION


/*
Triggered is called
Department Name			Transaction Employee ID			Date OF Transaction				Amount			
Litigation					   132						2015-05-15 00:00:00		        -2.77			

*/
select top(1) * from view_department
go

--Alter the Trigger

ALTER trigger tr_view
on [dbo].[view_department]
INSTEAD OF DELETE
as BEGIN

SET NOCOUNT ON

select * from deleted

END --output : Commands completed successfully.

BEGIN TRANSACTION 

delete from view_department
where Amount = -2.77 and [Transaction Employee ID] = 132

ROLLBACK TRANSACTION
go 


Drop trigger tr_view