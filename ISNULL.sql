use [Rajat 720_140]
go

-- ISNULL TAKES 2 argumnets

select * from employee where EmployeeMiddleName is NULL


--declare @var varchar(15) = 'OPTION A'
declare @var as varchar(15)

select isNULL(@var,'No OPTION') as MyOption

select isnull('ABC',1) --output = ABC ignore the datatpye precedence gets whatever is not null

CREATE TABLE test
(myoption varchar(20) NULL)

insert into test values('option A')


select coalesce(myoption,'NO OPTION') as myoption
into new_null
from test  -- can create a column null as well not null column

drop table new_null
drop table test