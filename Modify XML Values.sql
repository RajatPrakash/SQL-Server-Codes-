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

--select @x

--select @x.value('/Shopping[1]/ShoppingTrip[2]/Item[3]','varchar(50)')

--set @x.modify('replace value of (/Shopping[1]/ShoppingTrip[1]/Item[3])[1] with "gold"')

set @x.modify('insert <Item>"platinum"</Item>
				into (/Shopping/ShoppingTrip)[2]')
select @x