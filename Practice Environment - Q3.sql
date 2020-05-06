use rajat_practice
go

select * from employees

select * from department

---Q1:select Numebr of Employees per department

select d.dname ,count(*) as 'Number of employee'
from department d join employees e
on e.deptid = d.deptid
group by d.dname

---@2 Name of department in which max number of employees are working

--USING TOP--
select top(1) d.dname,count(*) as count
from department as d join employees as e
on e.deptid  = d.deptid
group by d.dname
order by count

--USING OFFSET
select d.dname,count(*) as count
from department as d join employees as e
on e.deptid  = d.deptid
group by d.dname
order by count
OFFSET 0 ROWS
 FETCH NEXT 1 ROWS ONLY


 ---@4  Find States with highest number of cities

 select * from state
 select * from city


select s.sname,count(*) 'Number of cities'
from state as s join city as c
on c.sid = s.sid
group by s.sname


--Q:5 Query to find the state with max number of cities

select top(1) s.sname,count(*) as count
from state as s join city as c
on c.sid = s.sid
group by s.sname
order by count desc









