-- Convert between Number types
--Implicit 

DECLARE @new DECIMAL(5,2);

SET @new = 5;
SELECT @new as 'Converted Values'-- 5.00
go

--Explicit

SELECT CONVERT(DECIMAL(5,2),4) AS 'Converted Value'
SELECT CAST(5 AS DECIMAL(5,2)) AS 'Converted Value'

go

SELECT CONVERT(INT,13.77) + CONVERT(int,13.11) AS 'SUM'