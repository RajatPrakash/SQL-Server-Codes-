use rajat_practice


select * from employees
select * from department

select * 
from employees as e right join department as d
on e.deptid = d.deptid 

select * 
from employees as e left join department as d
on e.deptid = d.deptid 