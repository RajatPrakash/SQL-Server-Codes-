use rajat_practice
go

-- Hash , Inner Loop and Merge join

select * 
from tblEmployee as t left join tblDepartment as d
on t.Department = d.Department  --Hash Match
go

select * 
from tblEmployee as t left join tblDepartment as d
on t.Department = d.Department  
where d.Department = 'HR' --Nested Loops

--Merge join uses an index scan 



