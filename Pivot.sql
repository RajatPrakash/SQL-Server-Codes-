use [Rajat 720_140]
go

---Pivot(function(Values) for TheHorizontalRow in (Values of TheVerticalRow)), column remains will automatically made into vertical formate 
--into pivot table

with NewTable as
(
SELECT YEAR(DateOfTransaction) as Year, MONTH(DateOfTransaction) AS Month,Amount from tblTransaction
)

select * from NewTable
PIVOT(sum(amount) for Month in([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) AS MyPivot
order by Year


