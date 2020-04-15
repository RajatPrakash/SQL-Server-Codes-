ALTER TABLE EMPLOYEE ADD Department Varchar(20);



select * from employee where EmployeeLastName = 'word'
go

INSERT INTO EMPLOYEE VALUES	(
132,'Dylan','A','Word','HQ104916N','11/3/1971','Litigation')

TRUNCATE TABLE EMPLOYEE

ALTER TABLE EMPLOYEE 
ALTER COLUMN EmployeeMiddleName	VARCHAR(20)



SELECT * FROM EMPLOYEE

ALTER TABLE EMPLOYEE 
ALTER COLUMN EmployeeMiddleName VARCHAR(10) 

	
SELECT * FROM EMPLOYEE where DateOfBirth BETWEEN '19760101' and '19790101'

SELECT * FROM EMPLOYEE WHERE YEAR(DateOfBirth) Between 1976 and 1982 and MONTH(DateOfBirth) BETWEEN 6 and 8 order by DateOfBirth

go

select year(DateOfBirth),COUNT(*) from EMPLOYEE GROUP BY year(DateOfBirth) order by year(DateOfBirth)
select count(*) as '1990' from employee where year(DateOfBirth) = 1990

go

select * from employee;


SELECT LEFT(EmployeeFirstName,1),COUNT(*) from employee
where year(DateOfBirth) > 1971 
GROUP BY LEFT(EmployeeFirstName,1) 
Having count(*) > 50 
ORDER BY COUNT(*) DESC
go

select LEFT(EmployeeLastName,1) as 'FirstWord', Count(*) as count from EMPLOYEE
where year(DateOfBirth) > 1968 
GROUP BY LEFT(EmployeeLastName,1) 
Having Count(*) > 20
ORDER BY count;

update EMPLOYEE
set EmployeeMiddleName = NULL
where EmployeeMiddleName = ''

select * from employee where EmployeeMiddleName is null
go

select datename(month,DateOfBirth) as Monthy, count(*) as count from EMPLOYEE
group by datename(month,DateOfBirth), datepart(month,DateOfBirth)
order by datepart(month,DateOfBirth)


select count(*) from employee where EmployeeMiddleName is Not NULL