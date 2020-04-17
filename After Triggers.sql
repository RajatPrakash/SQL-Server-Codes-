use [rajat 720_140]
go

/* Trigger Structure 

CREATE TRIGGER TriggerName
    ON [dbo].[TableName]
    FOR DELETE, INSERT, UPDATE
    AS
    BEGIN
    SET NOCOUNT ON  
    END
*/

SET NOCOUNT ON  

select * from dept  -- By default message apprears when we execute the query : (4 rows affected)

SET NOCOUNT OFF  --Commands completed successfully only appears
go

---Lets Create  a Trigger-------------

Create Trigger tr_tblTransaction 
on tblTransaction
after delete,insert,update
AS BEGIN
	select * from inserted
	select * from deleted
END   --- output : Commands completed successfully.
go

------Insert operation-------------------
BEGIN TRANSACTION

insert into tblTransaction
values(111,'2011-01-01',111.11)

ROLLBACK TRANSACTION

------Delete operation-------------------
BEGIN TRANSACTION

delete from tblTransaction
where EMPLOYEEID = 123

ROLLBACK TRANSACTION


------Update operation-------------------

BEGIN TRANSACTION

update tblTransaction
set EmployeeID = 001
where EMPLOYEEID = 123

ROLLBACK TRANSACTION