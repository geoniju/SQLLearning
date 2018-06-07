---Gaining insights into product sales across all territories  using a cross join

select
	[SalesTerritoryKey],
	ProductKey,
	sum(salesAmount) as TotalSales
from
	[dbo].[OnlineSales]
where [OrderDate] between '2014-01-01' and '2014-01-31'
group by
	SalesTerritoryKey,productkey


---clearly only products that have a sale are shown which does not answer the original question
---Hence let us cross join sales territories to products the result is a combination across all territories and products



select
	st.SalesTerritoryKey,prod.ProductKey
from 

	SalesTerritory st cross join Product prod


----Final solution incorporating the above queries

select
	st.SalesTerritoryKey,prod.ProductKey,prod.productname,isnull(TerritorySales.TotalSales,0)
from 

	SalesTerritory st cross join Product prod left join
	(
select
	[SalesTerritoryKey],
	ProductKey,
	sum(salesAmount) as TotalSales
from
	[dbo].[OnlineSales]
where [OrderDate] between '2014-01-01' and '2014-01-31'
group by
	SalesTerritoryKey,productkey
	) as TerritorySales on TerritorySales.SalesTerritoryKey=st.SalesTerritoryKey and
	TerritorySales.Productkey=prod.productkey	
order by TotalSales desc