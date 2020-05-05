Use rajat_practice


select * from country
select * from city
select * from state

-- query to find Country with respective states

select s.sname,c.cname from State s join country c 
on 
s.cid= c.cid

-- query to find Country with respective city

select ci.city_name,c.cname from country c join state s 
on s.cid = c.cid join city ci on
ci.sid = s.sid
order by c.cname

-- Query to find out states that are in USA

select S.sname,c.cname from country c join state s 
on c.cid =s.cid
where c.cname = 'USA'

-- Query to find out in which state particular city is located
select s.sname,c.city_name from  city c join state s 
on s.sid = c.sid
order by s.sname
