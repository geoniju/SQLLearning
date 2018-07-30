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
order by 
	age

--Marketing called up and asked for MEDIAN Salary to be added to the dataset

select
age,
	count(MemberKey) as count,
	min(annual_salary) as minsal,
	max(annual_salary) as maxsal,
	avg(annual_salary) as avgsal,
	(select distinct PERCENTILE_CONT(0.5) within group (order by annual_salary desc) over (partition by age)
	from [dbo].[Member] mem1 where mem1.age=mem.age) as MedianSal
from
	[dbo].[Member] mem
group by	
	age	
order by 
	age


select 
annual_salary
	
from
	dbo.Member
where age=19
order by
	annual_salary desc


--Write a query to sum all claim paid amounts for the cause of 'Shoulder Injury' 
--and calculate the Median claim paid amount for this cause

select sum(mem.claimpaidamount) as SumAmount,
	(select distinct PERCENTILE_CONT(0.5) within group (order by claimpaidamount desc) over (partition by ClaimCause)
	from [dbo].[MemberClaims] mem1 where mem1.ClaimCause='Shoulder Injury') as MedianSal
from
	[dbo].[MemberClaims] mem
where 
	ClaimCause='Shoulder Injury'
	

