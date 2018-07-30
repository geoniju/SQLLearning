--min function demo

select 
	*
from 
	[dbo].[Member]


--the policy manager wants to know the lowest annual salary of our members

select 
	min(annual_salary) as MinAnnualSalary
from 
	[dbo].[Member]

---claim manager looking for detail around the claim categories/causes that paid the smallest
-- amount and  what was the % contribution of claims paid by the cause

select
	[ClaimCauseCategory],
    [ClaimCause],
	min(claimpaidamount) as SmallestAmount,
	(min(claimpaidamount)/sum(claimpaidamount))*100 as contributionPercent
from
	[dbo].[MemberClaims]
where claimstatus='PAID'
group by
	[ClaimCauseCategory],
    [ClaimCause]
order by
	1
	

--Write a query to find the minimum salary and date joined fund for the members with the status of 
--'2) Medium Earner'

select 
	min([date_joined_fund]),
	min([annual_salary]) MinimumSalary

from
	[dbo].[Member]

where
	employee_status='2) Medium Earner'
group by
	
	[date_joined_fund]


