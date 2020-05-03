drop table #tblxml

create table #tblxml (id int , xol xml)

insert into #tblxml(xol)
select * from 
openrowset(bulk 'B:\T-sql Codes\OpenRowSet DATA.txt', SINGLE_BLOB) as x

select * from #tblxml