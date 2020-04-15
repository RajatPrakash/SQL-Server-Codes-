use [rajat 720_140]
go


create table testing
(
id int,
name varchar(20),
age int constraint Check_Age check (age > 18)
)

select * from testing


insert into testing(id,name) values(2,'Prateema')


insert into testing(id,name,age) values(3,'roshan',9)

alter table testing
add constraint Check_Age1 check (age > 18)


alter table testing
drop constraint Check_Age













