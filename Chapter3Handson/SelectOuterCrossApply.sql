---The promotion manager wants to know if customers purchased
-- products again during a specific promo month and if so does it correlate to the promo?

select 
distinct cust.customerkey,
cust.LastName,
os.OrderQuantity,
(select min(orderdate) from OnlineSales os1 where os1.customerkey=cust.customerkey	and 
 OrderDate between '2014-01-01' and '2014-01-31') as FirstOrderDate,
 (select max(orderdate) from OnlineSales os1 where os1.customerkey=cust.customerkey	and 
 OrderDate between '2014-01-01' and '2014-01-31') as LastOrderDate
from
customer cust left join
OnlineSales os on cust.CustomerKey=os.CustomerKey and
					os.OrderDate between '2014-01-01' and '2014-01-31'
order by os.OrderQuantity desc
----other way using group by 

select 
 cust.customerkey,
cust.LastName,
os.OrderQuantity,
 min(os.orderdate)  as FirstOrderDate,
max(os.orderdate) as LastOrderDate
from
customer cust left join
OnlineSales os on cust.CustomerKey=os.CustomerKey and
					os.OrderDate between '2014-01-01' and '2014-01-31'
group by 
cust.customerkey,
cust.LastName,
os.OrderQuantity
order by os.OrderQuantity desc
	







select * from 
OnlineSales
where customerkey='16368'

select 
	customerkey,count(*)
from
	OnlineSales
where OrderDate between '2014-01-01' and '2014-01-31'
group by
CustomerKey
having
	count(*)>1


---using outer apply is like a left join (as above but nicer to code and easy to add more columns)

select
	cust.customerkey,
	LastName,
	OrderQuantity,
	FirstOrdered,
	MostRecentOrdered
	

from
	customer cust
outer apply
	(
	select 
		OrderQuantity,min(orderdate) FirstOrdered ,max(orderdate) as MostRecentOrdered from onlinesales os 
	where 
		cust.customerkey=os.customerkey and
		os.OrderDate between '2014-01-01' and '2014-01-31'
	group by 
		OrderQuantity
	
	) oa
order by oa.MostRecentOrdered desc

----inner join and correlated subquery

select 
distinct cust.customerkey,
LastName,
OrderQuantity,
(select min(orderdate) from OnlineSales os1 where os1.customerkey=cust.customerkey	and 
 OrderDate between '2014-01-01' and '2014-01-31') as FirstOrderDate,
 (select max(orderdate) from OnlineSales os1 where os1.customerkey=cust.customerkey	and 
 OrderDate between '2014-01-01' and '2014-01-31') as LastOrderDate
from
customer cust inner join
OnlineSales os on cust.CustomerKey=os.CustomerKey and
					os.OrderDate between '2014-01-01' and '2014-01-31'


--cross apply is similar to inner join as above
select
	cust.customerkey,
	LastName,
	OrderQuantity,
	FirstOrdered,
	MostRecentOrdered
	

from
	customer cust
cross apply
	(
	select 
		OrderQuantity,min(orderdate) FirstOrdered ,max(orderdate) as MostRecentOrdered from onlinesales os 
	where 
		cust.customerkey=os.customerkey and
		os.OrderDate between '2014-01-01' and '2014-01-31'
	group by 
		OrderQuantity
	
	) oa
order by oa.MostRecentOrdered desc



