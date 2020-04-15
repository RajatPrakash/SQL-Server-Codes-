--Non Integer Values

DECLARE @new NUMERIC(5,2)

SET @new = 55.68; --55.68
SELECT @new AS 'Value' --ByDefault Numeric data type round off the function

SET @new = 55;
SELECT @new AS 'Value' --55.00
go

DECLARE @new1 NUMERIC(5)

SET @new1 = 55.68;
SELECT @new1 AS 'Value'  -- 56

