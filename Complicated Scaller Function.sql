--For a given Employee Number How many Transaction has occured--

if exists (select * from sys.objects where name = 'NumberOfTransaction')
	DROP function NumberOfTransaction
go

CREATE FUNCTION NumberOfTransaction(@EmployeeID INT)
RETURNS INT
AS 
BEGIN
	DECLARE @COUNT int

	SELECT @Count = Count(*) FROM tblTransaction 
	WHERE EmployeeID = @EmployeeID

	RETURN @Count
END
go

SELECT *, dbo.NumberOfTransaction(EmployeeID) as NumberOfTransaction
from EMPLOYEE


---Normally ---

select E.EmployeeID,E.EmployeeFirstName,E.EmployeeLastName,Count(t.Amount) as NumberOfTransaction
from EMPLOYEE As E left join tblTransaction as T 
on E.EmployeeID = T.EmployeeID
group by E.EmployeeID,E.EmployeeFirstName,E.EmployeeLastName
