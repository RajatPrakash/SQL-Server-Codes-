begin transaction

ALter Table tbltransaction alter column employeeid int null

Alter table tbltransaction
add constraint deafult_employeeid 
DEFAULT 125 for employeeid

alter table tblTransaction with nocheck
add constraint fk_employeeid Foreign Key(Employeeid)
References Employee(employeeid)
on update set default
--Commands completed successfully.


 update employee set employeeid = 123456 where employeeid = 123

 select e.employeeid as Employee,T.*
 from employee e Right join tblTransaction t
 on e.employeeid = t.employeeid 
 where t.amount in(-179.47,786.22,-967.36,957.03)


RollBack transaction