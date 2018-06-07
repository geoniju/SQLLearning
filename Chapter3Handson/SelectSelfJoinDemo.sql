--- self join

--- phase 1 : same products supplied  by different suppliers, just reveals the keys

select distinct
	PS1.ProductKey,
	'' as productname,
	0 as listprice,
	PS1.SupplierKey,
	'' as name

from
	ProductSupplier PS1
inner join
	ProductSupplier PS2 on	PS1.ProductKey=PS2.ProductKey and
	PS1.SupplierKey <> PS2.SupplierKey


UNION

--- phase 2 : same products supplied  by different suppliers and show the supplier name

select distinct
	PS1.ProductKey,
	'' as productname,
	0 as listprice,
	PS1.SupplierKey,
	sup.name
from
	ProductSupplier PS1
inner join
	ProductSupplier PS2 on	PS1.ProductKey=PS2.ProductKey and
	PS1.SupplierKey <> PS2.SupplierKey
inner join
	Supplier sup on	ps1.SupplierKey=sup.SupplierKey

UNION
--- phase 2 : same products supplied  by different suppliers and show the product name and the supplier name


select distinct
	PS1.ProductKey,
	prod.productname,
	prod.listprice,
	PS1.SupplierKey,
	sup.name
from
	ProductSupplier PS1
inner join
	ProductSupplier PS2 on	PS1.ProductKey=PS2.ProductKey and
	PS1.SupplierKey <> PS2.SupplierKey
inner join
	Supplier sup on	ps1.SupplierKey=sup.SupplierKey inner join
	Product prod on ps1.ProductKey=prod.ProductKey


--Create a SELF JOIN on tables ProductSupplier where 1 product 
--has more than one supplier reduce the list to product 405

select distinct
	PS1.ProductKey,
	prod.productname,
	prod.listprice,
	PS1.SupplierKey,
	sup.name
from
	ProductSupplier PS1
inner join
	ProductSupplier PS2 on	PS1.ProductKey=PS2.ProductKey and
	PS1.SupplierKey <> PS2.SupplierKey
inner join
	Supplier sup on	ps1.SupplierKey=sup.SupplierKey inner join
	Product prod on ps1.ProductKey=prod.ProductKey
where prod.Productkey='405'
