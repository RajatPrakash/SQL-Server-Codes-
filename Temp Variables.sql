-- Creating a temporary variable and initiallisng it.
declare @MyVar as int  = 2;

--Retriving the value 
select @myVar as myvariable

-- Increasing the value by 1
set @MyVar  = @MyVar+1

SELECT @MyVar as Testing
go

--Creating a integer value and perforing mathematical operations
DECLARE @new INT ;
SET @new = 10;

-- Performing multiplication operation 

SET @new = @new *20

--Retriving the value
select @new as 'Interger Value'
go

-- Mathematical Functions
--Initialise a variable , give it datatype (not int) and give it inital value

DECLARE @test NUMERIC(7,2) = 5;

select @test as 'numeric value'

select POWER(@test,3) as 'Power of Number'

SELECT SQUARE(@test) as 'Square of Number'

SELECT SQRT(@test) as 'Square Root'
go

--Declaring a decimal number and performing Mathematical OPerations on it

DECLARE @decimal as Numeric(5,3);
SET @decimal = 45.559

SELECT @decimal AS 'Decimal Value'

SELECT FLOOR(@decimal) AS 'Floor Operation'
SELECT CEILING(@decimal) AS 'Ceiling Operation'
SELECT ROUND(@decimal,0) AS 'Round Function' 



