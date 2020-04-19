---Adding new Ros to the target table which will tell us whether data is inserted or updated


BEGIN TRANSACTION

ALTER TABLE tblTransaction
ADD Comments varchar(25) NULL
go

--select * from tblTransaction

MERGE into tblTransaction as T   --T : traget
using (select EmployeeID,DateOfTransaction,sum(Amount) as Amount from newtransaction
group by EmployeeID,DateOfTransaction) as S	     --S : Source
ON T.Employeeid = S.Employeeid AND
T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED THEN
	UPDATE SET Amount = T.Amount + S.Amount ,Comments = 'UPDATED'
WHEN NOT MATCHED BY TARGET THEN
	INSERT ([Amount],[DateOfTransaction],[EmployeeID],Comments)
	values(s.Amount,s.DateOfTransaction,S.Employeeid,'INSERTED')
WHEN NOT MATCHED BY SOURCE THEN
	UPDATE SET Comments = 'ORIGINAL DATA';
	--outptut : 1667 rows affected	but we neww to check the output what is affected so
	
	-- output inserted.*,deleted.*,$action --action tell exactly what happened
	select * from tblTransaction-- where Comments = 'INSERTED'

	

ROLLBACK TRANSACTION

