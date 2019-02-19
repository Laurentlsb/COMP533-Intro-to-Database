/* 4 Query */
/* 4.0.1 */
select p.productCode, p.productName, i.ingId, i.ingName, i.category, r.qty, r.unit
from Product p, Ingredient i, Recipe r
where p.productCode = r.productCode and i.ingId = r.ingId and p.productCode = 'db' 
order by i.ingName
  
/* 4.0.2 */
create or replace view temp_1 as
select quoteId, sum (qty * unitCost) as cost
from quoteItem
group by quoteId;

create or replace view temp_2 as
select supplierId, (cost + tax +fees) as  totalcost
from temp_1, ingQuote
where temp_1.quoteId = ingQuote.quoteId;

select supplierName, totalcost
from (select *
      from temp_2
      where temp_2.totalcost = (select min(temp_2.totalcost) from temp_2)) as q1, Supplier
where q1.supplierId = Supplier.supplierId
/* The quote with the lowest cost comes from 'Houston’s Best Food', 85.48 dollars. */

/* 4.0.3 */
select sum(productprice.price)
from productprice join sale on productprice.productcode = sale.productcode
/* The total income is 288.75 dollars. */

								