use [Rajat 720_140]
go

-----Working with  XML---------------

DECLARE @x XML
SET @x = '<Shopping ShopperName="Rajat Prakash" Weather="Nice">
<ShoppingTrip ShoppingTripID="L1">
	<Item Cost = "5">Bananas</Item>
	<Item Cost = "5">Apples</Item>
	<Item Cost = "5">Cherries</Item>
</ShoppingTrip>
<ShoppingTrip ShoppingTripID = "L2">
	<Item>Emeralds</Item>
	<Item>Diamonds</Item>
	<Item>Furniture</Item>
</ShoppingTrip>
</Shopping>'

select @x as XML_OUTTPUT


--Alter table employee add data xml DEFAULT null

select * from employee where EmployeeID=200

update EMPLOYEE 
set data = @x
where EmployeeID = 200

select * from employee where EmployeeID=200
