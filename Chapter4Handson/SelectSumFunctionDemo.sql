---demo sql sum function

--- foundation sql query

select
	*
from
	MemberClaims c1
order by 
	claimpaiddate desc



--The claim manager requested for the total claims paid  for death and TPD claims 
--during the year 2014

select
	year(claimpaiddate) as [Year],
	ClaimType,
	sum(claimpaidamount) as TotalAmount
from
	MemberClaims c1
where 
	claimtype in ('TPD','DTH') AND year(claimpaiddate)=2014

group by year(claimpaiddate),
	ClaimType
order by 
	year(claimpaiddate) desc
	

--The claim manager requested list of top 5 claim cause categories  for 
--claim type  TPD for 2014 and grouped by the member gender

select 
	top(5) sum(claimpaidamount) as totalamount,
	year(claimpaiddate) as [Year],
	m.gender,
	ClaimCauseCategory,
	ClaimType
from
	MemberClaims mc join 
	member m on mc.MemberKey=m.MemberKey
where 
	claimtype='TPD' and
	year(claimpaiddate)=2014
group by
	year(claimpaiddate), 	
	m.gender,
	ClaimCauseCategory,
	ClaimType
order by 
	totalamount 
desc



---Write a query to aggregate the Claim paid for the year 2010 where the claimants
-- reside in postal code 4061, ensure Claim Cause is returned in the query

select 
	claimcause,
	sum(claimpaidamount) 

from
	[dbo].[MemberClaims] MC inner join
	[dbo].[Member]  M on MC.MemberKey=M.MemberKey 
where
	year(claimpaiddate)=2010 and
	m.postal_code='4061'
group by claimcause

	







