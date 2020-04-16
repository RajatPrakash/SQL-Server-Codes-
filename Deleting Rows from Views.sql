use [Rajat 720_140]
go

begin transaction

select count(*) from view_department

delete from view_department 
where Amount = 999.99

select count(*) from view_department

Rollback Transaction

/* 
Output:
view_department' is not updatable because the modification affects multiple base tables.

Multiple tables are there hence cannot delete directly ,
But for a simple view showing data of only one table delete operation can be performed
*/
go


create view simple as 
select * from tblTransaction 
go

begin transaction

select count(*) from simple

delete from simple
where EmployeeID = 502

select count(*) from simple

rollback transaction

select * from EMPLOYEE