with CustomerCTE ( CustID, Total)
as
(
	select Customers.CustID, sum(Orderlines.Cost * OrderLines.Quantity)
	from Customers
	inner join Orders on Orders.CustomerID = Customers.CustID
	inner join OrderLines on OrderLines.OrdID = Orders.OrderID
	where Orders.OrderDate > dateadd(MONTH, -6, getdate())
	group by Customers.CustID
)
select CustID, Total
from CustomerCTE
where Total > 100 and Total < 500
