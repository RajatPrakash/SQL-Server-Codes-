DECLARE @x XML

set @x = '<Shopping ShopperName="Rajat Prakash" Weather="Nice">
  <ShoppingTrip ShoppingTripID="L1">
    <Item Cost="50">Bananas</Item>
    <Item Cost="46">Apples</Item>
    <Item Cost="9">Cherries</Item>
  </ShoppingTrip>
  <ShoppingTrip ShoppingTripID="L2">
    <Item>Emeralds</Item>
    <Item>Diamonds</Item>
    <Item>Furniture</Item>
  </ShoppingTrip>
</Shopping>'


select tbl.col.query('.')
from @x.nodes('/Shopping/ShoppingTrip') as tbl(col)


--insert data from xml to a table

select  tbl.col.value('.','varchar(50)') as item,
		tbl.col.value('@Cost','Varchar(50)') as cost
into tbltemp1
from @x.nodes('/Shopping/ShoppingTrip/Item') as tbl(col)

select * from tbltemp1
--create table cost (name varchar(50),cost varchar(50))