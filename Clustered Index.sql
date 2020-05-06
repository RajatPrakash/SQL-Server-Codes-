--FYI: clustered Index can be created on rows having multiple records but not the primary key

select * from tblEmployee

--SEEK : More optimal solution 
--SCAN

create clustered index idx_employee on [dbo].[tblEmployee]([EmployeeNumber]) 

--USING Display estimated plan
select * from tblEmployee
where EmployeeNumber = 131


select * from tblEmployee

drop index idx_employee on [dbo].[tblEmployee]


--Clustered Index can also be created by Creating Primary key 

select * 
into [dbo].[employees2]
from tblEmployee
where EmployeeNumber <>131

Alter table [dbo].[employees2]
add constraint pk_emp PRIMARY KEY (employeenumber)

select * from employees2
select * from tblEmployee
where EmployeeNumber = 123