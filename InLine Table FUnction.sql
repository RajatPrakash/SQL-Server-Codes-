
Create Function TableTransacion(@employeeid int)
RETURNS TABLE AS RETURN
(
	select * from tblTransaction 
	where EmployeeID = @employeeid
)
go


--Since it is a table function function, return table so it cannot be called with select 

select dbo.TableTransacion(123)

-- it will only be called in from or where only

select * from dbo.TableTransacion(123)

--In where Clause --

select * from EMPLOYEE
where exists (select * from dbo.TableTransacion(EmployeeID))