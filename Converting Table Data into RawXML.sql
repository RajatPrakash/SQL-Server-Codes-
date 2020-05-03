----Converting Table Row into XML data----


--Raw XML--

select e.EmployeeID,EmployeeFirstName,e.EmployeeLastName,t.Amount,t.DateOfTransaction
from employee as e
left join tblTransaction as t 
on e.EmployeeID = t.EmployeeID
where e.EmployeeID between 202 and 208
for xml raw('MyRow'),elements