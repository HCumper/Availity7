select FirstName, LastName
from Customers
where left(LastName, 1) = 'S'
order by LastName desc