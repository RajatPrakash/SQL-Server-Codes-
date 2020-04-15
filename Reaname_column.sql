select * from tblTransaction

truncate table tblTransaction


-- alter table tblTransaction rename Column EmployeeNumber to EmployeeID

exec sp_rename 'tblTransaction.EmployeeNumber','EmployeeID','Column' 

select count(*) from employee e RIGHT join tbltransaction t on e.EmployeeID = t.EmployeeID --and amount is not null

select count(*) from employee

select * from employee e LEFT join tbltransaction t on e.EmployeeID = t.EmployeeID  --and amount is null

select count(*) from tblTransaction

create table test1(id int,designation varchar)
go

select * from test;

drop table test;

select * from test t CROSS join test1 e --on t.id=e.id

go
use [Rajat 720_140]
go

CREATE table  dept(deptid int , deptname varchar(20))

insert into dept values (1,	'Litigation'),
(2,	'Commercial'),
(3,	'HR'),
(4,	'Customer Relations')
go

select * from dept
select * from EMPLOYEE
select * from tblTransaction
go

select d.deptname,sum(amount) as sum from dept d join employee e on 
d.deptname = e.Department 
join
tblTransaction t on
e.EmployeeID = t.EmployeeID
group by (d.deptname),Department
order by Department

select top(3) * from employee;

insert into employee values(124,'Carolyn','Andrea','Zimmerman','AB234578H','1975-06-01','Customer Relations')

select * from (
select EmployeeID,EmployeeFirstName,EmployeemiddleName,EmployeeLastName,Department,count(*) as count from employee
group by EmployeeID,EmployeeFirstName,EmployeemiddleName,EmployeeLastName,Department
having count(*) > 1) as temp 

select top(2) * from employee

select count(*)  from tblTransaction --where EmployeeID is NULL


truncate table tblTransaction

begin transaction 

select e.EmployeeID as EmployeeNumber,t.EmployeeID as TransactionEmployeeNumber,EmployeeFirstName,EmployeeLastName,sum(amount) as sum 
from employee e Right join tblTransaction t on
e.EmployeeID = t.EmployeeID
where e.EmployeeID  is NULL 
group by e.EmployeeID,EmployeeFirstName,EmployeeLastName,t.EmployeeID
 --having t.EmployeeID < 2
--order by t.EmployeeID
 
 select count(*) from tblTransaction

 delete from tblTransaction
from employee e Right join tblTransaction t on
e.EmployeeID = t.EmployeeID
where e.EmployeeID  is NULL 

 select count(*) from tblTransaction

rollback transaction

select count(*) from tblTransaction

