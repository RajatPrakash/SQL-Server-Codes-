-- Working With types of integer

DECLARE @NewInteger SMALLINT;

SET @NewInteger  = 20000;

select @NewInteger as 'Small Int Value'

-- Setting bigger Value for same Variable

SET @NewInteger = 3000000;

SELECT @NewInteger AS 'Int Level value ' -- Error : Arithmetic overflow error for data type smallint, value = 200000.
go


-- Creating new variable with Data type that can hold much bigger values
DECLARE @UpdatedInt INT;

SET @UpdatedInt  = 300000;

SELECT @UpdatedInt AS 'Int Values '


Set