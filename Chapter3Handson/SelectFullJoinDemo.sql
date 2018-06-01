---demo the full outer join in a select 
 

select 
	LastName,
	NumberChildrenAtHome,
	City
from
	Customer cust full outer join
	Geography geo on cust.GeographyKey=geo.GeographyKey



select 
	LastName,
	NumberChildrenAtHome,
	City
from
	Customer cust full join
	Geography geo on cust.GeographyKey=geo.GeographyKey



---what is the average lead time of crowley sport
select name,AverageLeadTime from [dbo].[Supplier] sup left join
[dbo].[ProductSupplier] prosup on sup.SupplierKey=prosup.SupplierKey

 where name like '%rowley%'