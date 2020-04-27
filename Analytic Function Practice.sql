use [Rajat 720_140]
go


-----------Working with Row Number-------------- 
CREATE TABLE #Duplicates(Col1 INT, Col2 CHAR(1));
INSERT INTO #Duplicates(Col1, Col2) 
VALUES(1,'A'),(2,'B'),(2,'B'),(2,'B'),
	(3,'C'),(4,'D'),(4,'D'),(5,'E'),
	(5,'E'),(5,'E');
go
--Duplicates-----------
SELECT col1,count(*) as count FROM #Duplicates group by col1 having count(*) >1;
go
drop table #Duplicates
----Using row number to give the unique rpw value to each rows 
select col1,col2,
row_number() over(partition by col1,col2 order by col1) as 'ROW NUMBER'
from #Duplicates
/*
col1	col2	ROW NUMBER
1	A	1
2	B	1
2	B	2
2	B	3
3	C	1
4	D	1
4	D	2
5	E	1
5	E	2
5	E	3
*/

-- deleting duplicates from table with the help of row number 

delete from #Duplicates
where row_number() over(partition by col1,col2 order by col1 ) <>1  
--Windowed functions can only appear in the SELECT or ORDER BY clauses.
go

-- it can be done using a common table expression (CTE).

with dupes AS (
select col1,col2,
row_number() over(partition by col1,col2 order by col1) as 'ROW'
from #Duplicates )
delete dupes 
where ROW <> 1


----AFter deleting the duplicates records with the help of row number--------------
select col1,col2,
row_number() over(partition by col1,col2 order by col1) as 'ROW NUMBER'
from #Duplicates

/*
col1	col2	ROW NUMBER
1	      A      	1
2		  B			1
3		  C			1
4		  D			1
5		  E			1
*/