---demo the right outer join in a select

select 
	LastName,
	YearlyIncome,
	City
from 
	dbo.customer cust right outer join
	dbo.Geography geo on cust.GeographyKey=geo.GeographyKey



select 
	LastName,
	YearlyIncome,
	City
from 
	dbo.customer cust right join
	dbo.Geography geo on cust.GeographyKey=geo.GeographyKey


/*Create a RIGHT JOIN on tables Product and ProductSupplier , select the ProductName
 and SupplierKey where the product name is 'Mountain-300 Black, 48'*/

select 
	ProductName,
	SupplierKey

from 
	dbo.Product pro right join
	dbo.ProductSupplier prosup on pro.ProductKey=prosup.ProductKey
where ProductName='Mountain-300 Black, 48'

