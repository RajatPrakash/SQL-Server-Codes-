use [Rajat 720_140]
go


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


