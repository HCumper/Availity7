select Customers.CustID, sum(Orderlines.Cost * OrderLines.Quantity)
from Customers
inner join Orders on Orders.CustomerID = Customers.CustID
inner join OrderLines on OrderLines.OrdID = Orders.OrderID
where Orders.OrderDate > dateadd(MONTH, -6, getdate())
group by Customers.CustID
union
select Customers.CustID, 0
from Customers
where CustID not in (select CustomerID from Orders where Orders.OrderDate > dateadd(MONTH, -6, getdate()))
