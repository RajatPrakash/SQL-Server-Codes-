use [Rajat 720_140]
go


BEGIN TRANSACTION

CREATE TABLE Attendance
(EmployeeID int,
AttendanceMonth Date,
NumberAttendance smallint,
constraint pk_Attendance PRIMARY KEY(EmployeeID,AttendanceMonth),
constraint fk_EmployeeID FOREIGN KEY(EmployeeID)
REFERENCES employee(EmployeeID)
)

select * from Attendance
select * from employee where EmployeeID = 3
delete from EMPLOYEE where EmployeeID = 3
Commit TRANSACTION


DROP TABLE Attendance





