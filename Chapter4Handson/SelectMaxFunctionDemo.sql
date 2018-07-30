--Max() function Demo

select
	*
from
	member


--the product manager wants to know the max salary of the members

select
	max(annual_salary)
from
	Member


--Marketing wants to understand the counts,min,max,mean salaries for all members of age range 19 to 65 grouped by age

select
age,
	count(MemberKey) as count,
	min(annual_salary) as minsal,
	max(annual_salary) as maxsal,
	avg(annual_salary) as avgsal
from
	[dbo].[Member]
group by
	age


--Write a query to return the maximum IP cover premium for the underwriting year of 2012



select 
	max(total_ip_cover_premium)
from
	dbo.MemberCover
where
	underwriting_year='2012'