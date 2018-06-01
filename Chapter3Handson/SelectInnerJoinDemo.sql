---demo of the inner join sql select

select 
	ProductName
	,ListPrice
	,[UnitsBalance]
from 
	[dbo].[Product] prod inner join 

	[dbo].[ProductInventory] inv on prod.ProductKey=inv.ProductKey




select 
	ProductName
	,ListPrice
	,[UnitsBalance]
from 
	[dbo].[Product] prod join 

	[dbo].[ProductInventory] inv on prod.ProductKey=inv.ProductKey


---What color are the Short-Sleeve Classic Jersey ?

select * from dbo.Product  where ProductName like '%Short-Sleeve%';



