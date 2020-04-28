use [Rajat 720_140]
go

select count(*) as count from employee

select count(*) as count from tblTransaction



select * from tblTransaction as t
left join employee as e
on t.EmployeeID = e.EmployeeID
--where e.EmployeeFirstName is NULL
go


select * from tblTransaction as t
right join employee as e
on t.EmployeeID = e.EmployeeID
--where t.Employeeid is NULL


select * from tblTransaction as t
join employee as e
on t.EmployeeID = e.EmployeeID
order by amount


-----last name starts with y-----------------
select t.* from tblTransaction as t
join employee as e
on t.EmployeeID = e.EmployeeID
where e.EmployeeLastName like 'y%'
order by amount


----using sub queries

select * from 
tblTransaction
where EmployeeID in 
(select EmployeeID from EMPLOYEE where EmployeeLastName like 'y%')
order by EmployeeID