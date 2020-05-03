--Query to get only the element name from xml

--flwor  :  IMORTANT FOR QUERY for let here order by return


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

-- for and return is used in this query
select @x.query('for $itename in /Shopping/ShoppingTrip/Item
				return concat(string($itename),",") ')

--Ordering the above generated list with cost of items
select @x

-- for and return is used in this query
select @x.query('for $itename in /Shopping/ShoppingTrip[1]/Item
				let $Cost := $itename/@Cost
				where $Cost > 10
				order by $Cost
				return concat(string($itename),",") ')