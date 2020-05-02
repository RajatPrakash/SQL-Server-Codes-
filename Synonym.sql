use [Rajat 720_140]

create synonym emp 
for employee



select * from emp

--Another DB Table--
select * from
[master].[dbo].[firstable]


Create Synonym RemoteFirstTable
for [master].[dbo].[firstable]
go

select * from RemoteFirstTable