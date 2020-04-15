use [rajat 720_140]
go

---Adding a primary key to a existing table---------------------

select top(1)* from employee

alter table employee
add constraint pk_Employeeid PRIMARY KEY(EmployeeId) -- since duplicate values found on exsiting data ,  statement has been terminated.

-- finding duplicate values-----

select employeeId , count(*) as count from employee
group by EmployeeID
having count(*) >1    -- we found employeeid 3 and 1 with count 3 each

select * from employee where employeeid in (1,3)

--deleting duplicate record----
delete top(1)
from employee
where employeeid = 3

---Adding a primary key to a existing table again---------------------

select * from employee

alter table employee
add constraint pk_Employeeid PRIMARY KEY(EmployeeId)  --Commands completed successfully.
