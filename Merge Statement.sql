use [Rajat 720_140]


select count(*) from newtransaction

select count(*) from tblTransaction
go

BEGIN TRANSACTION


MERGE into tblTransaction as T   --T : traget
using newtransaction as S	     --S : Source
ON T.Employeeid = S.Employeeid AND
T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED THEN
	UPDATE SET Amount = T.Amount + S.Amount 
WHEN NOT MATCHED BY TARGET THEN
	INSERT ([Amount],[DateOfTransaction],[EmployeeID])
	values(s.Amount,s.DateOfTransaction,S.Employeeid);


ROLLBACK TRANSACTION

/*  ERROR
The MERGE statement attempted to UPDATE or DELETE the same row more than once. 
This happens when a target row matches more than one source row. 
A MERGE statement cannot UPDATE/DELETE the same row of the target table multiple times. 
Refine the ON clause to ensure a target row matches at most one source row, or use the GROUP BY clause to group the source rows.
*/
go
---finding duplicates on saource table

select EmployeeID,DateOfTransaction,count(*) from newtransaction
group by EmployeeID,DateOfTransaction
having count(*) > 1