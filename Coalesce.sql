use [Rajat 720_140]
go

-- COALESCE takes as many argumnet as you want 1,2, or more
-- output is based on highest of precedence  od datatype

declare @A as varchar(15) = 'A'
declare @B as varchar(15) = 'B'

select COALESCE(@A,@B,'NO OPTION') as MyOption 

select COALESCE('ABC',1)  -- output : Conversion failed when converting the varchar value 'ABC' to data type int.

--but this will pass--------------

select COALESCE(1,'ABC')  -- output : 1


CREATE TABLE test
(myoption varchar(20) NULL)

insert into test values('option A')

select coalesce(myoption,'NO OPTION') as myoption
into new_coalesce
from test  ---this will create a new table with column null as define in parent table, but isNULL can create null or not null column also

drop table new_coalesce
drop table test