delete from recipe
where ingId = 10 or ingId = 11 or ingId = 12

insert into Ingredient (ingId, ingName, category) values
	(17, 'optional', 'drink');
	(15, 'optional', 'ice cream base'),
	(16, 'optional', 'topping');
	
insert into Recipe (productCode, ingId, qty, unit) values
	()

select * from recipe order by ingid
select * from ingredient 

create or replace view required_item as
select Product.productCode, Product.productName, Ingredient.ingId, Ingredient.ingName, Ingredient.category, Recipe.qty, Recipe.unit
from Product, Ingredient, Recipe
where Product.productCode = Recipe.productCode and Ingredient.ingId = Recipe.ingId and Product.productCode = 'db' and Ingredient.ingName != 'optional'
order by Ingredient.ingName;

create or replace view one as
select *
from ingredient i natural join recipe r 
where i.ingName = 'optional' and r.productCode = 'db'


select i.ingid, i.ingname, i.category, one.productcode, one.qty, one.unit
from one, Ingredient i
where i.category = one.category and i.ingName != 'optional' and i.ingname != 'hot fudge'