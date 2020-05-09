use rajat_practice


select * from employees
where deptid = 10

create nonclustered index idx_depatid on [dbo].[employees](deptid)

--Can Create multiple non clustered index
create nonclustered index idx_depatid1 on [dbo].[employees](deptid,hiredate,eid)
