---Avg() function demo

--product manager wants to get an idea of the mean of insurance covers and premium
--paid across the age groups in year 2014


select 
	count(*)
from 
	[dbo].[Member]


select
	sum(total_death_cover)/(select count(*) from [dbo].[Member])
from 
	[dbo].[MemberCover]
where underwriting_year=2014


select 
	count(distinct(memberkey))  
from
	[dbo].[MemberCover]
where underwriting_year=2014


select
	sum(total_death_cover)/(7480)
from 
	[dbo].[MemberCover]
where underwriting_year=2014


select
	avg(total_death_cover)
from 
	[dbo].[MemberCover]
where underwriting_year=2014


select 
	count(*)
from 
	[dbo].[MemberCover]
where
	total_death_cover is not null
	and underwriting_year=2014

--Note: avg function ignores null values

select
	avg(total_death_cover) as AvgDthCover,
	avg([total_death_cover_premium]) as AvgDthCoverPremium,
	M.age
	
from 
	[dbo].[MemberCover] MC inner join 
	[dbo].[Member] M on MC.MemberKey=M.MemberKey
where underwriting_year=2014
group by M.age


--Write a query to find the average Claim Paid amount and Total Death Cover 
--amount where claimants have insurance cover for death in the 
--underwriting year of 2012 and were paid (hint status). 
--The claim type to return is 'DTH' and the Cause Category is 'FATALITY'

select 
	avg([total_death_cover]) AvgDeathCoverSum, AVG(claimpaidamount) as TotalClaimPaidAmount
from
	[dbo].[MemberClaims] MCL INNER JOIN
    [dbo].[MemberCover] MCO ON MCL.MemberKey=MCO.MemberKeY
	WHERE MCO.underwriting_year=2012 AND 
	[claimstatus]= 'PAID' and 
	[ClaimCauseCategory] = 'FATALITY' AND
	[ClaimType]='DTH'