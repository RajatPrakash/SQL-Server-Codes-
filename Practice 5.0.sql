use [Rajat 720_140]
go
---Working with Estimate Execution Plan
select * from tblTransaction as t
join (select * from EMPLOYEE 
where EmployeeLastName like 'y%' ) as e
on e.EmployeeID = t.EmployeeID
order by t.EmployeeID


select * from tblTransaction as t
left join EMPLOYEE as e
on e.EmployeeID = t.EmployeeID
and e.EmployeeLastName like 'y%'
order by t.EmployeeID

select * from tblTransaction as t
left join EMPLOYEE as e
on e.EmployeeID = t.EmployeeID
where e.EmployeeLastName like 'y%'
order by t.EmployeeID
