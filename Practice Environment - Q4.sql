use rajat_practice
go

--Q:1 Query to find only those state with  number of cities greater than 1

select s.sname,count(*)  as count
from state as s join city as c
on c.sid = s.sid
group by s.sname
having count(*) > 1
order by count

--Q2: List of department in which less than 2 employees work
select d.dname,count(*)	as cnt
from employees as e join department as d
on e.deptid =d.deptid
group by d.dname 
having count(*) < 2
