use [Rajat 720_140]
go

--Creating a duplicate table and adding a additional row in it
select *,ROW_NUMBER() over(order by (select NULL))%3  as ShouldIDelete
into newtransaction
from tblTransaction

BEGIN TRANSACTION

delete from newtransaction 
 where ShouldIDelete = 1

 COMMIT TRANSACTION

 select top(1) * from newtransaction


 update newtransaction 
 set DateOfTransaction = dateadd(day,1,DateOfTransaction)
 where ShouldIDelete = 2

 alter table newtransaction
 drop column ShouldIDelete
 go

  select * from tbltransaction --row count : 2497

  select * from newtransaction --row count : 1664
  go

 select * from tbltransaction
 union
 select * from newtransaction  --Removed duplicates row count - 3329
 go

select * from tbltransaction
union all	
select * from newtransaction  -- row count : 4161


---only selected rows   EXCEPT
--this will only generate data from first table that are not in second table
select * from tblTransaction 
except
select * from newtransaction  --row count:1665

-----------INTERESCT onlu common data is shown/ --------------------------------------------------------
 select * from tblTransaction 
 INTERSECT
 select * from newtransaction  --832 common data
 order by EmployeeID
--checking: select * from newtransaction where EMPLOYEEID = 828