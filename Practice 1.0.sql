-- Find the error in result set and work accordinly
select system_type_id, column_id, system_type_id / CAST(column_id as Float) as Calculation
from sys.all_columns
go


-- ROUND The result set upto nearest value
select system_type_id, column_id, ROUND(system_type_id / CAST(column_id as Float),1) as Calculation
from sys.all_columns
go

--multiply first column by 2 and then convert it into tiny int
select system_type_id, column_id, CONVERT(TINYINT,system_type_id*2) as Calculation
from sys.all_columns
go  --Error :Arithmetic overflow error for data type tinyint, value = 330.  Tiny int can hold upto 255 only


--Instead of reult we can place null
select system_type_id, column_id, TRY_CONVERT(TINYINT,system_type_id*2) as Calculation
from sys.all_columns