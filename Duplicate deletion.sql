use [rajat 720_140]
go

------------deleteing multiple duplicate rows at once -------------

begin transaction

;with CTE as
(
select top(1)* from dept where deptid in(2,3,4)
)

delete from CTE
select * from dept
commit transaction
go

----deleting single row
delete from dept where deptid = 4 and deptname = 'Customer Relations'