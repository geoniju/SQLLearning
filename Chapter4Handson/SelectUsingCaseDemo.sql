--Case demo

--The policy manager observed that the data in member cover does not show a column for covertype
--how can we create a list of member covers that shows the cover type abbrevation eg : DTH for the underwriting year 2014


--searched case expression (within a select statement, the searched case expression allows for values to be replaced
--in the result set based on comparison value)
select 
	MemberKey,
	total_death_cover,
	'CoverType' = 
	case 
		when total_death_cover != 0 then 'DTH'
	end
FROM
	[dbo].[MemberCover]	
where 
	underwriting_year=2014
	and  total_death_cover !=0 --note that not equal to zero does not return null values

--simple case expression (within a SELECT statement a simple case expression allows for only an equality 
--check no other comparisons are made)

select 
	case gender
	when 'Male' then 'M'
	when 'Female' then 'F'
	else '?' 
	end as genderabbr
from
	dbo.Member



--Write a query to use a search case to create an abbreviated band where the age 
--band is '(49 - 58) Baby boomers' , set the new band equal to 'Boomer' and ensure 
--the else is included for the non matched age bands otherwise a NULL will appear in
-- the band value , include the member key in the column and order by this key

select 
	MemberKey,
	case age_band
		when '(49 - 58) Baby boomers' then 'Boomer'
	else NULL
	end
from
	[dbo].[Member]
order by 
	MemberKey 
