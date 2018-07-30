/*

	Chapter 5 Project work (2)
	Insurance claims margin analysis 

	-- Scenario --- Understanding policy margins , are we profitable ? Bear in mind this is totally fictitious data and bears no
				    resemblance to any insurance business , living or deceased!

*/

use [Chapter 4 - Insurance] ;				-- <<< use chapter 4 Insurance database for this project

-- The product manager wants a simple statement of the profitability of TPD insurance for years 2012 to 2014
-- The Claims value will be compared to ALL TPD premiums to establish the margin (profit)
--                                      *******  

-- This query only returns the Claimant Premium, which is fine if analysing the claims/claimant margin, but we
-- want ALL of TPD premiums regardless, for further analysis
--      **********
select 
	 [underwriting_year]
	,cl.ClaimType,
	sum(total_tpd_cover_premium) as total_tpd_cover_premium_sum
	,sum(cl.claimpaidamount) as TotalClaimPaid
	,sum([total_tpd_cover_premium]) - sum(cl.claimpaidamount) as CoverProfit 
from
	[dbo].[MemberClaims] cl inner join
	[dbo].[MemberCover] mc on cl.MemberKey = mc.MemberKey and
							  cl.ClaimType = 'TPD' and 
							  year(cl.claimpaiddate) in (2012,2013,2014) and
							  underwriting_year = year(cl.claimpaiddate)
group by
	 [underwriting_year]
	,cl.ClaimType
	---,[total_tpd_cover_premium]
order by
	 [underwriting_year]

-- We use an outer apply to see ALL TPD premiums as that is what was requested, it is important a 
-- data analyst comprehends the question fully, question the user or yourself when looking for insight
-- as misunderstanding the question can be disastrous 

select 
	 YearlyPremium.underwriting_year
	,cl.ClaimType
	,YearlyPremium.TPDCoverPremium
	,sum(claimpaidamount) as TotalClaimPaid
	,YearlyPremium.TPDCoverPremium - sum(cl.claimpaidamount) as CoverProfit 
from
	[dbo].[MemberClaims] cl

outer apply

	(
		select
			 underwriting_year 
			,sum([total_death_cover_premium]) as DTHCoverPremium
			,sum([total_tpd_cover_premium])	  as TPDCoverPremium
			,sum([total_ip_cover_premium])    as IPCoverPremium
		from
			[dbo].[MemberCover] mc
		where
			mc.underwriting_year = year(cl.claimpaiddate)
		group by
			underwriting_year

	) as YearlyPremium

where
	year(cl.claimpaiddate) in (2012,2013,2014) and	
	cl.ClaimType = 'TPD'
group by 
	 YearlyPremium.underwriting_year
	,YearlyPremium.TPDCoverPremium
	,cl.ClaimType 

-- Student Prac 

-- The product manager wants a simple statement of the profitability of DTH insurance for years 2012 to 2014
-- The Claims value will be compared to ALL DTH premiums to establish the margin (profit)
--										*******





/*
Quiz 27 | 3 Questions
Construct a query to provide insight as to the profitability of the DTH insurance for the years 2012 to 2014.

You will need to compare claim paid for these years to the premium collected overall for these years.

The query has to return the following metrics �

1: Underwriting year

2: Claim type (DTH)

3: Claim count (DTH)

4: Total Death premium value

5: Count of policy holders (Death policies)

6: Total claim paid (DTH)

7: The margin value (Profit)

*/





select 
	 YearlyPremium.underwriting_year
	,cl.ClaimType
	,count(cl.memberkey) ClaimCount
	,YearlyPremium.DTHCoverPremium as DTHCoverPremium
	,YearlyPremium.DeathCoverPolicyHolderCount as DeathCoverPolicyHolderCount
	,sum(claimpaidamount) as TotalClaimPaid
	,YearlyPremium.DTHCoverPremium - sum(cl.claimpaidamount) as CoverProfit 
from
	[dbo].[MemberClaims] cl

outer apply

	(
		select
			 underwriting_year 
			 ,count([total_death_cover_premium]) as DeathCoverPolicyHolderCount
			,sum([total_death_cover_premium]) as DTHCoverPremium
			,sum([total_tpd_cover_premium])	  as TPDCoverPremium
			,sum([total_ip_cover_premium])    as IPCoverPremium
		from
			[dbo].[MemberCover] mc
		where
			mc.underwriting_year = year(cl.claimpaiddate)
		group by
			underwriting_year
			

	) as YearlyPremium

where
	year(cl.claimpaiddate) in (2012,2013,2014) and	
	cl.ClaimType = 'DTH'
group by 
	 YearlyPremium.underwriting_year
	,YearlyPremium.DTHCoverPremium
	,cl.ClaimType,
	YearlyPremium.DeathCoverPolicyHolderCount