
Create function multi(@employeeid int)
returns @list TABLE
(
amount smallmoney,
DateOfTransaction smalldatetime,
employeeid int
)
as
begin

	insert into @list 
	select * from tblTransaction where EmployeeID = @employeeid
	RETURN
end

go

select * from multi(123)

