use [Rajat 720_140]
go

--- where Clause in sub queries-------

select * from tblTransaction as t
join (select * from EMPLOYEE 
where EmployeeLastName like 'y%' ) as e
on e.EmployeeID = t.EmployeeID
order by t.EmployeeID

----we can also get the same result with normal join query

select * from tblTransaction as t
join EMPLOYEE as e
on e.EmployeeID = t.EmployeeID
and e.EmployeeLastName like 'y%'
order by t.EmployeeID


--which is better? use display estimate execution plan button!

