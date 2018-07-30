---The senior data anlayst requires a list of customer sales by quartile across country/province for france

--the view is a list of all sales table across the globe


select 
	*
from
	CustomerPurchasesAllTime
	

select 
	ntile(7) over(partition by geo.countryregionname order by sum(cp.PurchaseTotal) asc) as quartile,
	sum(cp.PurchaseTotal) as TotalPurchased,
	geo.CountryRegionName,
	geo.StateProvinceName
from
	CustomerPurchasesAllTime cp inner join
	[Geography] geo on cp.GeographyKey=geo.GeographyKey and
	geo.CountryRegionName='France'
group by 
	geo.CountryRegionName,
	geo.StateProvinceName 

select 
	sum(PurchaseTotal) as TotalPurchased
from
	CustomerPurchasesAllTime
where 
	Occupation='Professional'

select 
	ntile(4) over(partition by geo.countryregionname order by sum(cp.PurchaseTotal) asc) as quartile,
	sum(cp.PurchaseTotal) as TotalPurchased,
	geo.CountryRegionName

from
	CustomerPurchasesAllTime cp inner join
	[Geography] geo on cp.GeographyKey=geo.GeographyKey and
	geo.CountryRegionName='Australia' and
	cp.Occupation = 'Professional'
group by 
	geo.CountryRegionName

	