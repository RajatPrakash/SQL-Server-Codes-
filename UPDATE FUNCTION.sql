use [rajat 720_140]
go

ALTER Trigger tr_tblTransaction 
on tblTransaction
after delete,insert,update
AS BEGIN
	if update(EmployeeID)
	BEGIN
	select * from inserted
	select * from deleted
	END
END   --- output : Commands completed successfully.
go

BEGIN TRANSACTION

update tblTransaction 
set amount = 0
where employeeid=111

ROLLBACK TRANSACTION  --(4 rows affected)



BEGIN TRANSACTION

update tblTransaction 
set employeeid = 333
where employeeid=111

ROLLBACK TRANSACTION  

/*
OUTPUT:

 Amount	  DateOfTransaction	  EmployeeID
 111.00	  2020-01-01 00:00:00	111
-317.11	  2015-06-11 00:00:00	111
-556.52	  2015-07-08 00:00:00	111
 475.25	  2015-08-29 00:00:00	111

*/
