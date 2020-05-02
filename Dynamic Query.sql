Declare @command varchar(250)
set @command = 'select * from tblTransaction where employeeid = 129'
execute (@command)
go
--select * from tblTransaction where employeeid = 129


-----NEVER do this , Leads to SSQL INJECTION

declare @command varchar(250),@para varchar(50);
set @command = 'select * from tblTransaction where employeeid ='
set @para = '125'
execute(@command+@para)
--this can lead to sql injection
set @para = '125 or 1=1'
execute(@command+@para) --Gave all the data 
go

---------Much Safer way to work with Dynamic Query----------------
declare @command nvarchar(250),@para nvarchar(50);
set @command = N'select * from tblTransaction where employeeid =@ProductionID'
set @para = N'125'
execute sys.sp_executesql @statement = @command,@para = N'@ProductionID INT', @ProductionID = @para;


