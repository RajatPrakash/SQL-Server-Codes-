use rajat_practice
go

 CREATE TABLE department  (
  deptid int NOT NULL,
  dname varchar(20) DEFAULT NULL,
  location varchar(20) DEFAULT NULL,
  PRIMARY KEY (deptid)
)

select * from department

insert into department values(10,'sales','mumbai')
insert into department values(20,'Marketing','Chennai')
insert into department values(30,'Finance','Delhi')
insert into department values(40,'HR','ghaziabad')
insert into department values(50,'IT','NULL')
---------------------Department table create now employee time----------

CREATE TABLE employees (
  eid int NOT NULL,
  ename varchar(20) DEFAULT NULL,
  salary int DEFAULT NULL,
  deptid int DEFAULT NULL,
  designation varchar(20) DEFAULT NULL,
  mgrid int DEFAULT NULL,
  Commission int DEFAULT NULL,
  gender char(1) DEFAULT NULL,
  hiredate DATETIME NULL DEFAULT Current_timestamp,
  PRIMARY KEY (eid),
  CONSTRAINT employees_ibfk_1 FOREIGN KEY (deptid) REFERENCES department (deptid)
)

select * from employees

insert into employees values(1,'nikhil',120000,10,'Manager',0,30000,'M','20150205 00:00:00')
insert into employees values(2,'nitin',80000,10,'Manager',0,150000,'M','20130621 00:00:00')
insert into employees values(3,'sonali',50000,20,'Developer',1,5000,'F','20170305 00:00:00')
insert into employees values(4,'Prateema',50000,30,'Analyst',NULL,NULL,'F','20170125 00:00:00')
insert into employees values(5,'anshita',600000,30,'Trainer',2,300000,'F','20200319 09:00:41')
insert into employees values(6,'jayant',200000,20,'Developer',2,200000,'M','19980423 00:00:00')
insert into employees values(7,'abha',250000,10,'Manager',1,10000,'F','20200319 09:00:41')
insert into employees values(8,'Wasim',34000,30,'Assistant',1,NULL,'M','20200319 09:00:41')
insert into employees values(9,'ramu',56000,20,'Tester',2,25000,'M','20120223 00:00:00')
insert into employees values(10,'krishna',0,NULL,'NULL',0,0,'NULL','20200324 08:57:41')


------------INCREASING THE PRACTICE ENVIRONMENT BY ADD MORE TABLES

Create Table country(cid int,cname varchar(20))
insert into country values(1,'India'),(2,'USA')


Create Table state(sid int,sname varchar(20),cid int)

insert into state values(11,'MP',1),(22,'UP',1),(33,'Gujrat',1),(44,'Maharastra',1),(55,'California',2),(66,'FLORIDA',2),(77,'Karnataka',1)


Create Table city(city_id int,city_name varchar(20),sid int)

insert into city values(1111,'Indore',11),(222,'Ahemdabad',33),(212,'Rajkot',33),(212,'Surat',33),(214,'Pune',44),(215,'Mumbai',44),(216,'Los Angeles',55),(217,'Miami',66),(222,'Ujain',11)
,(333,'Bhopal',11),(444,'Jabalpur',11),(555,'Guna',11)


select * from city
select * from state
select * from country