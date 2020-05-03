--Question 1 In which department Nikhil is working.

--select * from department;
--select * from employees

select e.ename,d.dname,d.deptid from 
employees as e join department as d
on e.deptid = d.deptid
where e.ename = 'nikhil'  --Sales


--Question 2 In which Location Every employee is living.
select e.ename,e.designation,d.dname,d.location
from employees as e join department as d 
on e.deptid = d.deptid


--Question 3 Names of those employees who lives in mumbai

select *
from employees as e join department as d
on e.deptid = d.deptid
where d.location ='mumbai'