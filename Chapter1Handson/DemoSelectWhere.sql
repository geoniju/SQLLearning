select 
	*
from
	[dbo].[Customer]

where 
	[Gender]='F'

----This is a comment line

/*

this is a comment block

*/


select 
	*
from
	[dbo].[Customer]

where 
	Occupation like '%prof%'


--search based on a comparison operator

select 
	*
from
	[dbo].[Customer]

where 
	TotalChildren >= 4



---search meeting any of three conditions

select 
	*
from
	[dbo].[Customer]

where 
	TotalChildren >= 4 or
	YearlyIncome <= 60000 or
	HouseOwnerFlag = '1'


---search meeting any of three conditions

select 
	*
from
	[dbo].[Customer]

where 
	TotalChildren >= 4 or
	YearlyIncome <= 60000 or
	HouseOwnerFlag = '1'

	---search using range

select 
	*
from
	[dbo].[Customer]

where YearlyIncome between 75000 and 75500

---income less than 60000

select 
	*
from
	[dbo].[Customer]

where YearlyIncome < 60000

---own their home earn greater than 10000 and married

select 
	* 
from
	dbo.customer
where
	YearlyIncome > 100000 and
	MaritalStatus = 'M' and
	HouseOwnerFlag = '1'

----email with the name cedric and have betwen 2 & 4 children living at home

select 
	*
from
	dbo.customer
where

	EmailAddress like '%cedric%' and
	NumberChildrenAtHome between 2 and 4 
	
