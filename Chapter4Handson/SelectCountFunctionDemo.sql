---Demo SQL count

---The foundation query

select 
	*
from 
	member


---policy manager wants a count of member by gender

select count(*) as memcount,gender
from member
group by gender


---policy manager wants a count of distinct occupations
select 
	count(distinct(occupation)) as occupcount
from
	member



---policy manager wants a list of duplicate member biz keys

select 
	count(member_biz_key) as memcount,member_biz_key 
from 
	member 
group by 
	member_biz_key
having 
	count(*)>1
order by 
	2


---policy manger wants a count of countries members spread across

select 
	count(country) as CountryCount 
from
	member

use [Chapter 3 - Sales (Keyed) ];

---The sales manager wants a list of product count in each online sales order 
---to evaluate the greatest product count overall

select 
	distinct count(productkey) over(partition by salesordernumber) as prodcount , 
	SalesOrderNumber
from
	OnlineSales
order by 
	1 
desc

--over does not work on distinct column name
select 
	 count(distinct(productkey)) over(partition by salesordernumber) as prodcount , 
	SalesOrderNumber
from
	OnlineSales
order by 
	1 
desc
--group by works on distinct column name
select 
	 count(distinct(productkey)), 
	SalesOrderNumber
from
	OnlineSales
group by SalesOrderNumber
order by 1 desc






use [Chapter 4 - Insurance];

--Write a query to return the count of claims where the notification date is in the year 2014 and the claimants age is between 33 and 48


select 

COUNT(MC.MemberKey) AS MemberCount

from 
	[dbo].[MemberClaims] MC JOIN
	[dbo].[Member] M ON MC.MEMBERKEY=M.MemberKey
WHERE 
	year(claimnotificationdate)=2014 AND
	M.AGE BETWEEN 33 AND 48
