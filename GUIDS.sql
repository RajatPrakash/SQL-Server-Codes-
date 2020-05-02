/*
Identity for Sequecning a column has many problems like
 1) If table is deleted than sequce will begin from last deleted rownumber , trucate will only make it begin from starting
 2) RollBack A transaction will skip the Rownumber for new insertion , gaps can be there in IDENTITY.
*/

---GUIDS----128bits longs takes 16 times more storage than normal datatypes.

BEGIN TRANSACTION
declare @newvalue as uniqueidentifier --GUID
set @newvalue = NEWID()
select @newvalue
ROLLBACK TRANSACTION   ---every times createa a new value (random value)

CREATE TABLE TEST
(
id uniqueidentifier default newid(),
name varchar(2)
)

begin Transaction
insert into test(name) values('a'),('b'),('c')
select * from test
rollback Transaction --New ID is generated but sorting is issue
go

-------------MICROSOFT Version of NEWID which is SORTED  NEWSEQUENTIALID--------------
declare @newvalue as uniqueidentifier --GUID
set @newvalue = newsequentialid()
select @newvalue
ROLLBACK TRANSACTION  
--The newsequentialid() built-in function can only 
--be used in a DEFAULT expression for a column of type 'uniqueidentifier'
--in a CREATE TABLE or ALTER TABLE 


CREATE TABLE TEST1
(
id uniqueidentifier default newsequentialid(),
name varchar(2)
)

begin Transaction
insert into test1(name) values('a'),('b'),('c')
select * from test1
rollback Transaction --New ID is generated and sorted


