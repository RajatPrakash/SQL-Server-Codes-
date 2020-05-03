---to check the compatibility of my db with json , should be greater than 130
--SELECT compatibility_level FROM sys.databases --150 output

DECLARE @x varchar(2000)

SET @X = '{
"name":"Rajat",
"shopping":
			{"Trip":1,
			"Items":
			[
				{"Items":"Bananas","cost":5},
				{"Items":"Apples","cost":15}
			]
			
			}
}
'

select @x

select isjson(@x)--1