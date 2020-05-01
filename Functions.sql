use [Rajat 720_140]
go

--Create a simple function to add 1 to amount in transaction table--

--Creating a scaller function



CREATE FUNCTION AmountPlusOne(@Amount Smallmoney)
RETURNS smallmoney
AS
BEGIN
	RETURN @Amount+1
END
GO


select EMPLOYEEID,DateOfTransaction,Amount,dbo.AmountPlusOne(Amount) AS AMOUNTPLUSONE
from tblTransaction

---Function can also be called ---

declare @Submission smallmoney
exec @Submission = dbo.AmountPlusOne 223
select @Submission
go

--or--
declare @Submission smallmoney
exec @Submission = dbo.AmountPlusOne @Amount = 223
select @Submission













