--- Income vs education level by gender

select
	*
from
	
	[dbo].[Customer]



--- fields interested in 

select
	[YearlyIncome],[EducationLevel],[Gender]
from
	dbo.Customer


--Aggregation average income
select
	avg([YearlyIncome]) as YearlyIncome,[EducationLevel],[Gender]
from
	dbo.Customer
group by 
	[EducationLevel],[Gender]

order by [YearlyIncome] desc 

--calculate average over the group
select
	avg([YearlyIncome]) as YearlyIncome,[EducationLevel],[Gender]
from
	dbo.Customer
group by rollup([EducationLevel],[Gender])



/*Write a query to answer what the average number of 
children still living at home versus Married and
 Single customers, the query would look like which one on the list ?*/

 select distinct maritalstatus from dbo.customer;

 select

avg([NumberChildrenAtHome]) as [NumberChildrenAtHome],

[MaritalStatus]

from

[dbo].[Customer]



group by

[MaritalStatus]
having 
[MaritalStatus] = 'M' or

[MaritalStatus] = 'S'


 select

avg(YearlyIncome) as YearlyIncome


from

[dbo].[Customer]

where EducationLevel='Graduate Degree'
and Gender='F'

/* Customers that have completed Partial High School, what is
 the average number of cars owned across the genders (Hint, use rollup in the query ) ? */
 

select

avg(NumberCarsOwned) as AvgNumberCarsOwned,
Gender,EducationLevel

from

[dbo].[Customer]

where EducationLevel='Partial High School'

group by rollup (Gender,EducationLevel)

--having EducationLevel='Partial High School'


/* What is the average number of children for customers that are single ? */


select

avg(TotalChildren) as AVGTotalChildren

from

[dbo].[Customer]

where 
MaritalStatus='S'
