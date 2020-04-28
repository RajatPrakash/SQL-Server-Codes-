----Select Only top 5 employees of each department 

select * from 
(
select e.EmployeeID,e.EmployeeFirstName,e.EmployeeLastName,d.deptname,d.deptid,
rank() over(partition by d.deptname order by e.EmployeeID ) as MyRank
from EMPLOYEE  as e join dept as d
on e.Department = d.deptname
) as MyTable 
where MyRank <= 5
order by deptname
go
------Same thing can be done more easily with the help of WITH clause and creating a temp table
--co-realtedt query became the sub-query 
with MyTable AS
(select e.EmployeeID,e.EmployeeFirstName,e.EmployeeLastName,d.deptname,d.deptid,
rank() over(partition by d.deptname order by e.EmployeeID ) as MyRank
from EMPLOYEE  as e inner join dept as d
on e.Department = d.deptname)

select * from MyTable
where MyRank <= 5

go

-----------Creating more table and joining them------------------
with MyTable AS
(select e.EmployeeID,e.EmployeeFirstName,e.EmployeeLastName,d.deptname,d.deptid,
rank() over(partition by d.deptname order by e.EmployeeID ) as MyRank
from EMPLOYEE  as e inner join dept as d
on e.Department = d.deptname),
tran2020 as(
select * from tblTransaction)

select * from MyTable as m left join tran2020 t 
on m.EmployeeID = t.EmployeeID
where MyRank <= 5
