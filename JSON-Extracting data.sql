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

select json_query(@x,'$')  --$root give everything

select json_query(@x,'$.shopping') --start from shopping

select json_query(@x,'$.shopping.Items') --only give items


select json_value(@x,'$.name') --json_value retruns single value
							   --json_query retruns multiple value
