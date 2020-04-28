select * from EMPLOYEE 
where EmployeeLastName like 'y%' 



----------count number of transaction for each employees ------------------

select e.EmployeeID,e.EmployeeFirstName,e.EmployeeLastName,e.Department ,count(t.Amount)  'transaction'
from EMPLOYEE as e join tblTransaction as t
on e.EmployeeID = t.EmployeeID
where e.EmployeeLastName like 'y%'
group by e.EmployeeID,e.EmployeeFirstName,e.EmployeeLastName,e.Department
order by e.EmployeeID

----same thing but with the help of sub- query

select * ,(select count(t.Amount) 
			from tblTransaction as t
			where t.EmployeeID = e.EmployeeID
			) as Count
from employee as e 
where e.EmployeeLastName like 'y%' 

--- this is called co-related subquery since now we cannot run our sub query independently as it is dependent on out query
-- co-related sub queries always uses the aggregated function like count,sum,min,max etc , it can not be used like single expression


--we cannot use Corelated sub query as single expression-----------

select * ,(select t.Amount 
			from tblTransaction as t
			where t.EmployeeID = e.EmployeeID
			) as Count
from employee as e 
where e.EmployeeLastName like 'y%'

--OUTPUT : Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.
go

---Also Sub query cannot be used for two column aggregate together
select * ,(select count(t.Amount),sum(t.EmployeeID)
			from tblTransaction as t
			where t.EmployeeID = e.EmployeeID
			) as Count
from employee as e 
where e.EmployeeLastName like 'y%'
--OUTPUT : Only one expression can be specified in the select list when the subquery is not introduced with EXISTS.
go


-- for 2 Different column you need to write two corelated sub queries
select * ,(select count(t.Amount)
			from tblTransaction as t
			where t.EmployeeID = e.EmployeeID
			) as Count,
			(select sum(t.EmployeeID) --ANother subquery for differnet column to aggregate
			from tblTransaction as t
			where t.EmployeeID = e.EmployeeID) as 'sum'
from employee as e 
where e.EmployeeLastName like 'y%'
