use [Rajat 720_140]

/*

Rules ofr union 

- 1:Same number of columns shoud be there on both tables
- 2:Data type should be same or compatible 

*/

select convert(char(2),'Hi') as 'GREETING' -- column name are always taken from first datatpye
union
select convert(char(11),'Hello There!') As 'GREETING NOW'

/*
Output:
GREETING
Hi         
Hello There
*/
go


select convert(char(2),'Hi') as 'GREETING AGAIN'
union
select convert(char(11),'Hello There!') 
union
select convert(char(11),'Computer science')
union
select Convert(char(11),'Hi')  -- Duplicates are removed and only shows 3 result in dataset (Little time consuming process)
go

--To all even duplicates we can use UNION ALL
select convert(char(2),'Hi') as 'GREETING AGAIN'
union all
select convert(char(11),'Hello There!') 
union all
select convert(char(11),'Computer science')
union all
select Convert(char(11),'Hi')  -- Duplicates are shown this time , its quicker
go



---Working with different compatible datatypes

select convert(tinyint,45) as MyColumn
union
select convert(bigint,4550)  -- Combine datatype will be BIGINT , as that can hold both the values and naminging of the column will be of first datatype 

go 

-- ceating a temp table to check what datatype above query stored (Checking)

with cte as (
select convert(tinyint,45) as MyColumn
union
select convert(bigint,4550)
) 
select MyColumn 
into temp
from cte  --TRUE , Data is stored in BigInt 



---Failed coversion of different data type

select 'hi there'
union
select 4  --output : Conversion failed when converting the varchar value 'hi there' to data type int.