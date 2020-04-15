/*
Identity(1,1)
(Number from where you want to start,incremented number)

Rules fo identity
1: It Can be added during the creation of table 
2: It Can be added during the creation of of  a column i:e
	alter table tablename add columnname identity(1,1)

3:CANNOT be added on exiting column  
*/

Create table testing(
id int PRIMARY KEY IDENTITY(1,1),
Name varchar(20)
) --Commands completed successfully. IDENTITY Cretaed 

--inserting values 

--Case 1
insert into testing (name) values('Rajat')

select * from testing -- 1	Rajat inserted

--Case 2
insert into testing values(22,'Aryan')
--Error
/*An explicit value for the identity column in table 'testing' 
can only be specified when a column list is used and 
IDENTITY_INSERT is ON.
Dont Need to spicify id

*/

insert into testing (name) values('Aryan')

--Also--
insert into testing values('Rashika')

select * from testing
/*
output
id	Name
1	Rajat
2	Aryan
3	Rashika
*/


-- Can Add value to identity column using set identity_insert on and then off
set identity_insert testing ON

insert into testing(id,name) values(33,'neha')

set identity_insert testing off

-- check last identity used on a particular table   ::  IDENT_CURRENT('TABLENAME')


select IDENT_CURRENT('testing')















