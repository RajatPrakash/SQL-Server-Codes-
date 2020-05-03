use [Rajat 720_140]
go


select * from sys.sequences

create sequence sq1
START with 1
INCREMENT by 1



alter table tblTransaction
add UniValue int CONSTRAINT unique_value DEFAULT NEXT VALUE FOR sq1





BEGIN TRANSACTION

insert into tblTransaction(Amount,DateOfTransaction,EmployeeID)
values(232,'2011-01-01 00:00:00',123)

select * from tblTransaction where EmployeeID =123
 
ROLLBACK TRANSACTION

go



BEGIN TRANSACTION

update tblTransaction
set UniValue = next value for sq1
where UniValue is NULL

select * from tblTransaction order by UniValue

select top(1)* from tblTransaction order by UniValue desc
 
ROLLBACK TRANSACTION