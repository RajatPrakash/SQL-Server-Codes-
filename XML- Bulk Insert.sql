use [Rajat 720_140]
go

--Creating a temoporary Table

create table #tempxml(xmlcol xml)

bulk insert #tempxml from 'B:\T-sql Codes\Bulk Insert data.txt'

select * from #tempxml