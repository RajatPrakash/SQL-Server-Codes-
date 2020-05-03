----Converting Table Row into XML data----


--Path XML--

select e.EmployeeID,EmployeeFirstName,e.EmployeeLastName,t.Amount,t.DateOfTransaction
from employee as e
left join tblTransaction as t 
on e.EmployeeID = t.EmployeeID
where e.EmployeeID between 202 and 208
for xml path --very much similar to xml raw , elements
go

---make firstname and lastname as attribute instead of element
select e.EmployeeFirstName as '@FirstName',
       e.EmployeeLastName as '@lastName',
	   t.Amount,t.DateOfTransaction,e.EmployeeID
from employee as e
left join tblTransaction as t 
on e.EmployeeID = t.EmployeeID
where e.EmployeeID between 202 and 208
for xml path 
go

--remove the duplicacy with the help of sub query
select 
		e.EmployeeFirstName as '@FirstName',
       e.EmployeeLastName as '@lastName',
	   e.EmployeeID,
	   (select amount from tblTransaction as t
	   where e.EmployeeID = t.EmployeeID
	   for xml path(''),type) as 'Transaction'
from employee as e
where e.EmployeeID between 202 and 208
for xml path 
