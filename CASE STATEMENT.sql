use [Rajat 720_140]
go

DECLARE @option varchar(15) = 'Option C'

select CASE
	    when @option ='Option A' then 'OPTION 1 is selected '
		when @option ='Option B' then 'OPTION 2 is selected '
		ELSE 'NO OPTION IS SELECTED'	
		END As MyOption

go

----------------ALTER NATIVE OF ABOVE QUERY-------------------
DECLARE @option varchar(15) = 'Option C'

select CASE @option
	    when 'Option A' then 'OPTION 1 is selected '
		when 'Option B' then 'OPTION 2 is selected '
		ELSE 'NO OPTION IS SELECTED'	
		END As MyOption

go
---Work on table------------
--LEts get the government id first charatcer from table employee------------

select 
EmployeeID,
EmployeeFirstName,
EmployeeLastName,
EmployeeGovernmentID,
CASE 
	when left(EmployeeGovernmentID,1) = 'A'or left(EmployeeGovernmentID,1) = 'a' then 'STARTING WITH A'
	when left(EmployeeGovernmentID,1) = 'B'or left(EmployeeGovernmentID,1) ='b' then 'STARTING WITH B'
	else 'NITHER OF THEM'
	END AS 'FIRST LETTER'
from employee


---Another way-------------

select 
EmployeeID,
EmployeeFirstName,
EmployeeLastName,
EmployeeGovernmentID,
CASE left(EmployeeGovernmentID,1)
	when 'A'  then 'STARTING WITH A'
	when 'B'  then 'STARTING WITH B'
	else 'NITHER OF THEM'
	END AS 'FIRST LETTER'
from employee

DECLARE @option varchar(15) = 'Option A'

select CASE
	    when @option ='Option A' then 'OPTION 1 is selected '
		when @option ='Option B' then 2
		ELSE 'NO OPTION IS SELECTED'	
		END As MyOption

go  --output : Conversion failed when converting the varchar value 'OPTION 1 is selected ' to data type int.
 
 -- we can convert the int into string then use the query
 DECLARE @option varchar(15) = 'Option A'

select CASE
	    when @option ='Option A' then 'OPTION 1 is selected '
		when @option ='Option B' then convert(varchar(5),2)
		ELSE 'NO OPTION IS SELECTED'	
		END As MyOption

go --output : OPTION 1 is selected 
