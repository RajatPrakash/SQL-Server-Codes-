-- Shredding Converting XML data Into table

DECLARE @x XML

set @x = '<Shopping ShopperName="Rajat Prakash" Weather="Nice">
  <ShoppingTrip ShoppingTripID="L1">
    <Item Cost="5">Bananas</Item>
    <Item Cost="5">Apples</Item>
    <Item Cost="5">Cherries</Item>
  </ShoppingTrip>
  <ShoppingTrip ShoppingTripID="L2">
    <Item>Emeralds</Item>
    <Item>Diamonds</Item>
    <Item>Furniture</Item>
  </ShoppingTrip>
</Shopping>'

select @x.value('(/Shopping/ShoppingTrip/Item)[1]','varchar(50)') as ITEM  --Bananas

select @x.value('/Shopping[1]/ShoppingTrip[2]/Item[3]','varchar(50)') as ITEM  --Furniture

select @x.value('(/Shopping/ShoppingTrip)[1]/Item[2]/@Cost','varchar(50)') as ITEM  --Cost Of Apples : 5


select @x.exist('(/Shopping/ShoppingTrip/Item)[1]')--requires single parameter output 1

