-- Chapter 5 Project work (4)
-- Category performance over time (Time series) 

/*	-- Scenario --- 

	-- We are an online retailer, our CEO of wants a performance analysis of DAILY sales by
	-- product grouped by product category for the year 2013 , the CEO wants to see when the 
	-- product was first sold																				Paul **

	-- Our CEO has requested when was the product first stocked to be added to the summary as well			Student **
	-- do CSQ on [dbo].[ProductInventory] 


*/

-- Initial build up

	select
		 [OrderDate]
		,[ProductName]
		,sum([SalesAmount]) as TotalSales
	from
		[dbo].[OnlineSales] os inner join
		[dbo].[Product] prod on os.ProductKey = prod.ProductKey
	group by	 
		 [OrderDate]
		,[ProductName]
	order by
		 [OrderDate]
		,[ProductName]	

-- Add product categories 

	select
		 convert(date,[OrderDate]) as [Purchase date]
		,pc.ProductCategoryName
		,[ProductName]
		,sum([SalesAmount]) as TotalSales
		
	from
		[dbo].[OnlineSales] os inner join
		[dbo].[Product] prod on os.ProductKey = prod.ProductKey and
								year([OrderDate]) = 2013		inner join
		[dbo].[ProductSubcategory] psc on prod.ProductSubcategoryKey = psc.ProductSubcategoryKey inner join
		[dbo].[ProductCategory] pc on psc.ProductCategoryKey = pc.ProductCategoryKey
	group by	 
		 [OrderDate]
		,pc.ProductCategoryName
		,[ProductName]
	order by
		 [OrderDate]
		,pc.ProductCategoryName
		,[ProductName]	
	
-- Add product first sold using correlated sub query


	select
		 convert(date,[OrderDate]) as [Purchase date]
		,pc.ProductCategoryName
		,[ProductName]
		,(select min(cast(os1.[OrderDate] as date)) from [dbo].[OnlineSales] os1 where os1.ProductKey = os.ProductKey ) as [First sold date]
		,sum([SalesAmount]) as TotalSales
	from
		[dbo].[OnlineSales] os inner join
		[dbo].[Product] prod on os.ProductKey = prod.ProductKey and
								year([OrderDate]) = 2013		inner join
		[dbo].[ProductSubcategory] psc on prod.ProductSubcategoryKey = psc.ProductSubcategoryKey inner join
		[dbo].[ProductCategory] pc on psc.ProductCategoryKey = pc.ProductCategoryKey
	group by	 
		 [OrderDate]
		,pc.ProductCategoryName
		,[ProductName]
		,os.ProductKey
	order by
		 [OrderDate]
		,pc.ProductCategoryName
		,[ProductName]	




-- Prac work, item was first stocked 
/*
Quiz 29 | 2 Questions
Construct an ordered (by Order date, Category, Product asc) query to provide insight into the performance of daily sales across product categories and products for the year 2013

The query has to return the following metrics …

1: Purchase date

2: Product category

3: Product name

4: Date the product was first sold

5: Total sales

6: Date the product was first stocked

*/



	select
		 convert(date,[OrderDate]) as [Purchase date]
		,pc.ProductCategoryName
		,[ProductName]
		,(select min(cast(os1.[OrderDate] as date)) from [dbo].[OnlineSales] os1 where os1.ProductKey = os.ProductKey ) as [First sold date]
		,sum([SalesAmount]) as TotalSales
		,(select min(movementdate) from dbo.ProductInventory piy where piy.ProductKey=os.productkey ) as DateStock
	from
		[dbo].[OnlineSales] os inner join
		[dbo].[Product] prod on os.ProductKey = prod.ProductKey and
								year([OrderDate]) = 2013		inner join
		[dbo].[ProductSubcategory] psc on prod.ProductSubcategoryKey = psc.ProductSubcategoryKey inner join
		[dbo].[ProductCategory] pc on psc.ProductCategoryKey = pc.ProductCategoryKey
	group by	 
		 [OrderDate]
		,pc.ProductCategoryName
		,[ProductName]
		,os.ProductKey
	order by
		 [OrderDate]
		,pc.ProductCategoryName
		,[ProductName]	


select * from product where productname='Mountain-200 Black, 46'


select min(OrderDate) from OnlineSales where productkey in ('362','363')

 				select min(movementdate) from    [dbo].[ProductInventory] where ProductKey in ('362','363')