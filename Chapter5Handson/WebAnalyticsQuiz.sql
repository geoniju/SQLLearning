/*Construct an ordered (by DateKey asc) query to return the following metrics…

1: DateKey

2: Sum of Page views

3: Mean of Bounce rate pct*/





select
	[DateKey],
	sum(PageViews) over(partition by datekey) as SumOFPageViews,
	PERCENTILE_CONT(0.5) within group (order by [BounceRatePct] asc) over() as Med 
from
		

[dbo].[PageAnalysis]

order by
	DateKey asc

select datekey,bounceratepct
from
PageAnalysis
order by 
DateKey


/*

Page views vs bounce rate by month

Construct an ordered (by MonthYearName asc) query to return the following metrics…

1: MonthYearName

2: Sum of Page views

3: Mean of Bounce rate pct */

select
	
	[MonthYearName],
	sum([PageViews]) as SumPageViews,
	avg([BounceRatePct]) as AvgBounceRatePct

from

	[dbo].[Calendar] ca,
	[dbo].[PageAnalysis] pa
where ca.DateKey=pa.DateKey
group by 
	[MonthYearName] 
order by
	[MonthYearName] asc



/*
Average session duration vs returning visitor by week

Construct an ordered (by Year,Week asc) query to return the following metrics …

1: YearNum

2: WeekNum

3: Average session duration (in seconds)

4: Count of ‘Returning visitor’
*/

select 
	[YearNum],
	[WeekNumYear],
	avg(datediff(second,0,AvgSessionDuration)) as AvgSessionDurSecs,
	count(ut.usertypekey) as usercount
from
	[dbo].[Calendar] ca inner join
	[dbo].[VisitorAnalysis] va on ca.DateKey=va.DateKey left outer join 
	[dbo].[UserType] ut on va.UserTypeKey=ut.usertypekey and ut.usertype='Returning Visitor'
	
group by 
	[YearNum],
[WeekNumYear]


/*
New users vs page views by week


Construct an ordered (by Year,Week asc) query to return the following metrics …

1: YearNum

2: WeekNum

3: Sum of new users

4: Sum of Page views

*/

select 
	datepart(year,DateKey) as YearNum,
	datepart(week,DateKey) as WeekNum,
	sum(NewUsers) as SumNewUsers,
	sum(PageViews) as SumPageViews
from
	[dbo].[PageAnalysis] pa  

group by 
	datepart(year,DateKey),
datepart(week,DateKey)
order by
	[YearNum],
WeekNum asc

--
select * from Calendar