use [Rajat 720_140]
go

select * from tblTransaction
where EmployeeID in 
(select EmployeeID from employee where EmployeeLastName like 'y%')
order by EmployeeID


------------ANY---------------------

select * from tblTransaction
where EmployeeID = ANY 
(select EmployeeID from employee where EmployeeLastName like 'y%')
order by EmployeeID

--ANY uses OR condition (Truth Table), if condition matches with any of the element it will display the result 
--ALL uses AND condition (Truth Table) , it will display the result, if condition is true for every element 


-------------ALL-------------------

--generally used with <> 

select * from tblTransaction
where EmployeeID <> ALL 
(select EmployeeID from employee where EmployeeLastName like 'y%')
order by EmployeeID
