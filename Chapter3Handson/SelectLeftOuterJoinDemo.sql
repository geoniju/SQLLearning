---Demo the left outer join 

select
	 LastName
	,Gender
	,City
from
	dbo.Customer cust left outer join 
	dbo.Geography geo on cust.GeographyKey = cust.GeographyKey
where city is null



select
	 LastName
	,Gender
	,City
from
	dbo.Customer cust left join 
	dbo.Geography geo on cust.GeographyKey = cust.GeographyKey
where city is null

---what is the end of day rate for argentino peso

select * 

from 

	[dbo].[Currency] cur  
inner join 
	[dbo].[CurrencyHistory] curhis on
	cur.CurrencyKey= curhis.CurrencyKey
where datekey='20110420'
