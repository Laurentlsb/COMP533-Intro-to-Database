-- 1. Create Tables
CREATE TABLE Product
(
	productCode char(3) unique,
	productName varchar(50) unique not null,
	isAvailable integer default 0,
	primary key (productCode)
);

CREATE TABLE ProductPrice
(
	productCode char(3) references Product (productCode),
	startDate date,
	cost numeric,
	price numeric,
	primary key (productCode, startDate)
);

CREATE TABLE Ingredient 
(
	ingID serial not null,
	ingName varchar(50) not null,
	category varchar(50) not null,
	primary key (ingID),
	unique (ingName, category)
);

CREATE TABLE Recipe
(
	productCode char(3) references Product (productCode),
	ingId integer references Ingredient (ingId),
	qty numeric not null,
	unit varchar(20) not null,
	primary key (ingId)
);

CREATE TABLE truckEvent
(
	eventId serial,
	eventName varchar(200) not null,
	eventStart timestamp not null,
	plannedEnd timestamp not null,
	actualEnd  timestamp not null,
	primary key (eventID),
	unique (eventName, eventStart)
);

CREATE TABLE Sale
(
	saleId serial,
	eventId integer references truckEvent (eventId),
	productCode char(3) references Product (productCode),
	primary key (saleID)
);

CREATE TABLE SaleDetail
(
	saleId integer references Sale (saleId),
	ingId integer references ingredient (ingId),
	qty numeric not null,
	unit varchar(20) not null,
	primary key (saleId, ingId)
);

CREATE TABLE Supplier
(
	supplierId serial,
	supplierName varchar(150),
	street varchar(150),
	city varchar (150),
	state varchar(50),
	postalCode varchar(15),
	country varchar(150),
	primary key (supplierId),
	unique (supplierName, street, city)
);

CREATE TABLE SupplierPhone 
(
	supplierId integer references Supplier (supplierId),
	phoneType varchar(50),
	phoneNumber varchar(20),
	primary key (supplierId, phoneType)
);

CREATE TABLE LocalSupplier
(
	supplierId integer references Supplier (supplierId),
	mileageCost numeric not null,
	distance numeric not null,
	primary key (supplierId)
);

CREATE TABLE NationalSupplier
(
	supplierId integer references Supplier (supplierId),
	transportFee numeric,
	primary key (supplierId)
);

CREATE TABLE ingQuote
(
	quoteId serial,
	supplierId integer references Supplier (supplierId),
	issueDate date not null,
	expirationDate date not null,
	tax numeric not null,
	fees numeric not null,
	total numeric,
	primary key (quoteId),
	unique (supplierId, issueDate)
);

CREATE TABLE quoteItem
(
	quoteId integer references ingQuote (quoteId),
	ingId integer references Ingredient (ingId),
	qty numeric not null,
	unitCost numeric not null,
	unit varchar(20) not null,
	primary key (quoteId, ingId)
);

CREATE TABLE Delivery
(
	deliveryId serial,
	quoteId integer references ingQuote (quoteId),
	orderDate date not null,
	deliveryDate date default null,
	primary key (deliveryId)
);

CREATE TABLE InventoryItem
(
	ingId integer references Ingredient (ingId),
	quoteId integer references ingQuote (quoteId),
	expirationDate date,
	stockQty numeric not null,
	unit varchar(20) not null,
	qtyRemaining numeric,
	primary key (ingId, quoteId)
);

CREATE TABLE Equipment
(
	equipmentName varchar(50) unique,
	installDate date not null,
	primary key (equipmentName)
);

CREATE TABLE Maintenance
(
	maintId serial,
	equipmentName varchar(50) references Equipment (equipmentName),
	description varchar(150),
	beforeFlag integer not null,
	triggerQty integer not null,
	triggerUnit varchar(20) not null,
	minutes integer not null,
	primary key (maintId)
);

CREATE TABLE MaintenanceLog
(
	maintId integer references Maintenance (maintId),
	datePerformed date,
	minutes integer,
	notes text,
	primary key (maintId, datePerformed)
);




-- 2 Create Data
/* 2.1 db sundae */
insert into Product (productCode, productName) values
	('db', 'db sundae');	
insert into ProductPrice (productCode, startDate, price) values
	('db', CURRENT_DATE, 4);
insert into Ingredient (ingId, ingName, category) values
	(1, '10 oz dish', 'cup'),                                   
	(2, 'tall napkin', 'paper goods'),
	(3, 'short spoon', 'spoon'),
	(4, 'hot fudge', 'topping'),
	(5, 'chocolate', 'ice cream base'), 
	(6, 'vanilla', 'ice cream base'), 
	(7, 'sprinkles', 'topping'),
	(8, 'oreo', 'topping'),
	(9, 'peanuts', 'topping'),
	
	(15, 'optional', 'ice cream base'),
	(16, 'optional', 'topping');
insert into Recipe (productCode, ingId, qty, unit) values
	('db', 1, 10, 'each' ),                               
    ('db', 2, 1, 'each'),
    ('db', 3, 1, 'each'),
    ('db', 4, 1.5, 'ounce');
insert into Recipe (productCode, ingId, qty, unit) values	
	('db', 15, 6, 'ounce'),
	('db', 16, 1.5, 'ounce');
	
	
	
insert into Product (productCode, productName) values
	('sx', 'extra sundae topping');
insert into ProductPrice (productCode, startDate, cost, price) values
	('sx', CURRENT_DATE, 0.05, 0.25);

insert into Product (productCode, productName) values
	('mt', 'monkey tail');
insert into ProductPrice (productCode, startDate, cost, price) values
	('mt', CURRENT_DATE, 2.5, 5);
insert into ingredient (ingId, ingName, category) values
	(13, 'monkeytail', 'frozen banana');
insert into Recipe (productCode, ingId, qty, unit) values	
	('mt', 13, 1, 'each');

insert into Product (productCode, productName) values
	('dk', 'drink');
insert into ProductPrice (productCode, startDate, cost, price) values
	('dk', CURRENT_DATE, 0.44, 0.75);
insert into ingredient (ingId, ingName, category) values
	(10, 'coke', 'drink'),
	(11, 'sprite', 'drink'),
	(12, 'water', 'drink'),
	(17, 'optional', 'drink');
insert into recipe (productCode, ingId, qty, unit) values
	('dk', 17, 1, 'bottle');



/* 2.2 Equipment */
insert into Equipment (equipmentName, installDate) values
	('Rice', current_date),
	('Owl', current_date),
	('generator', current_date);
	
insert into Maintenance (maintId, equipmentName, description, beforeFlag, triggerQty, triggerUnit, minutes) values
	(1, 'Rice', 'clean', 0, 1, 'week', 120),
	(2, 'Owl', 'clean', 0, 1, 'week', 120),
	(3, 'generator', 'refuel', 0, 40, 'hour', 10),
	(4, 'generator', 'change oil&filter', 0, 200, 'hour', 30);

insert into MaintenanceLog (maintId, datePerformed, minutes, notes) values
	(3, '2018-03-01', 10, 'Purchase more diesel!');
insert into MaintenanceLog (maintId, datePerformed, minutes) values	
	(1, '2018-03-02', 100),
	(2, '2018-03-02', 110);


/* 2.3 TruckEvent */
insert into truckEvent (eventId, eventName, eventStart, plannedEnd, actualEnd) values
	(1, 'RMC study break', '2018-03-01 20:00:00', '2018-03-01 23:00:00', '2018-03-01 23:10:00');
insert into sale (saleId, eventId, productCode)	values
	(1, 1, 'db'),
	(2, 1, 'db'),
	(3, 1, 'db'),
	(4, 1, 'db'),
	(5, 1, 'db'),
	(6, 1, 'db'),
	(7, 1, 'db'),
	(8, 1, 'db'),
	(9, 1, 'db'),
	(10, 1, 'db'),
	(11, 1, 'db'),
	(12, 1, 'db'),
	(13, 1, 'db'),
	(14, 1, 'db'),
	(15, 1, 'db'),
	(16, 1, 'db'),
	(17, 1, 'db'),
	(18, 1, 'db'),
	(19, 1, 'db'),
	(20, 1, 'db'),
	(21, 1, 'db'),
	(22, 1, 'db'),
	(23, 1, 'db'),
	(24, 1, 'db'),
	(25, 1, 'db'),
	(26, 1, 'db'),
	(27, 1, 'db'),
	(28, 1, 'db'),
	(29, 1, 'db'),
	(30, 1, 'db'),
	(31, 1, 'db'),
	(32, 1, 'db'),
	(33, 1, 'db'),
	(34, 1, 'db'),
	(35, 1, 'db'),
	(36, 1, 'db'),
	(37, 1, 'db'),
	(38, 1, 'db'),
	(39, 1, 'db'),
	(40, 1, 'db'),
	(41, 1, 'db'),
	(42, 1, 'db'),
	(43, 1, 'db'),
	(44, 1, 'db'),
	(45, 1, 'db'),
	(46, 1, 'db'),
	(47, 1, 'db'),
	(48, 1, 'db'),
	(49, 1, 'db'),
	(50, 1, 'db'),
	(51, 1, 'db'),
	(52, 1, 'db'),
	(53, 1, 'db');
insert into SaleDetail (saleId, ingId, qty, unit) values
	(1, 6, 6, 'ounce'),    -- 10 vanilla without topping
	(2, 6, 6, 'ounce'),
	(3, 6, 6, 'ounce'),
	(4, 6, 6, 'ounce'),
	(5, 6, 6, 'ounce'),
	(6, 6, 6, 'ounce'),
	(7, 6, 6, 'ounce'),
	(8, 6, 6, 'ounce'),
	(9, 6, 6, 'ounce'),
	(10, 6, 6, 'ounce'),
	
	(11, 6, 6, 'ounce'),   --15 vanilla with oreo (15 vanilla + 15 oreo)
	(12, 6, 6, 'ounce'),
	(13, 6, 6, 'ounce'),
	(14, 6, 6, 'ounce'),
	(15, 6, 6, 'ounce'),
	(16, 6, 6, 'ounce'),
	(17, 6, 6, 'ounce'),
	(18, 6, 6, 'ounce'),
	(19, 6, 6, 'ounce'),
	(20, 6, 6, 'ounce'),
	(21, 6, 6, 'ounce'),
	(22, 6, 6, 'ounce'),
	(23, 6, 6, 'ounce'),
	(24, 6, 6, 'ounce'),
	(25, 6, 6, 'ounce'),                            
	(11, 8, 1.5, 'ounce'),  -- corresponding choice(oreo)
	(12, 8, 1.5, 'ounce'),
	(13, 8, 1.5, 'ounce'),
	(14, 8, 1.5, 'ounce'),
	(15, 8, 1.5, 'ounce'),
	(16, 8, 1.5, 'ounce'),
	(17, 8, 1.5, 'ounce'),
	(18, 8, 1.5, 'ounce'),
	(19, 8, 1.5, 'ounce'),
	(20, 8, 1.5, 'ounce'),
	(21, 8, 1.5, 'ounce'),
	(22, 8, 1.5, 'ounce'),
	(23, 8, 1.5, 'ounce'),
	(24, 8, 1.5, 'ounce'),
	(25, 8, 1.5, 'ounce'),
	
	(26, 5, 6, 'ounce'),   -- 5 chocolate with oreo (5 chocolate + 5 oreo)
	(27, 5, 6, 'ounce'),
	(28, 5, 6, 'ounce'),
	(29, 5, 6, 'ounce'),
	(30, 5, 6, 'ounce'),
	(26, 8, 1.5, 'ounce'),   -- corresponding choice(oreo)
	(27, 8, 1.5, 'ounce'),
	(28, 8, 1.5, 'ounce'),
	(29, 8, 1.5, 'ounce'),
	(30, 8, 1.5, 'ounce'),

	(31, 5, 6, 'ounce'),   -- 3 chocolate with peanuts (3 chocolate + 3 peanuts)
	(32, 5, 6, 'ounce'),
	(33, 5, 6, 'ounce'),
	(31, 9, 1.5, 'ounce'),  -- corresponding choice(peanuts)
	(32, 9, 1.5, 'ounce'),
	(33, 9, 1.5, 'ounce'),

	(34, 5, 6, 'ounce'),   -- reminder chocolate with sprinkles
	(35, 5, 6, 'ounce'),
	(36, 5, 6, 'ounce'),
	(37, 5, 6, 'ounce'),
	(38, 5, 6, 'ounce'),
	(39, 5, 6, 'ounce'),
	(40, 5, 6, 'ounce'),
	(41, 5, 6, 'ounce'),
	(42, 5, 6, 'ounce'),
	(43, 5, 6, 'ounce'),
	(44, 5, 6, 'ounce'),
	(45, 5, 6, 'ounce'),
	(46, 5, 6, 'ounce'),
	(47, 5, 6, 'ounce'),
	(48, 5, 6, 'ounce'),
	(49, 5, 6, 'ounce'),
	(50, 5, 6, 'ounce'),
	(51, 5, 6, 'ounce'),
	(52, 5, 6, 'ounce'),
	(53, 5, 6, 'ounce'),
	(34, 7, 1.5, 'ounce'),   -- corresponding choice(sprinkles)
	(35, 7, 1.5, 'ounce'),
	(36, 7, 1.5, 'ounce'),
	(37, 7, 1.5, 'ounce'),
	(38, 7, 1.5, 'ounce'),
	(39, 7, 1.5, 'ounce'),
	(40, 7, 1.5, 'ounce'),
	(41, 7, 1.5, 'ounce'),
	(42, 7, 1.5, 'ounce'),
	(43, 7, 1.5, 'ounce'),
	(44, 7, 1.5, 'ounce'),
	(45, 7, 1.5, 'ounce'),
	(46, 7, 1.5, 'ounce'),
	(47, 7, 1.5, 'ounce'),
	(48, 7, 1.5, 'ounce'),
	(49, 7, 1.5, 'ounce'),
	(50, 7, 1.5, 'ounce'),
	(51, 7, 1.5, 'ounce'),
	(52, 7, 1.5, 'ounce'),
	(53, 7, 1.5, 'ounce');

insert into sale (saleId, eventId, productCode)	values
	(54, 1, 'mt'),  -- 5 monkey tails
	(55, 1, 'mt'),
	(56, 1, 'mt'),
	(57, 1, 'mt'),
	(58, 1, 'mt');
	
insert into sale (saleId, eventId, productCode)	values
	(59, 1, 'dk'),    -- drinks
	(60, 1, 'dk'),
	(61, 1, 'dk'),
	(62, 1, 'dk'),
	(63, 1, 'dk'),
	(64, 1, 'dk'),
	(65, 1, 'dk'),
	(66, 1, 'dk'),
	(67, 1, 'dk'),
	(68, 1, 'dk'),
	(69, 1, 'dk'),
	(70, 1, 'dk'),
	(71, 1, 'dk'),
	(72, 1, 'dk'),
	(73, 1, 'dk'),
	(74, 1, 'dk'),
	(75, 1, 'dk'),
	(76, 1, 'dk'),
	(77, 1, 'dk'),
	(78, 1, 'dk'),
	(79, 1, 'dk'),
	(80, 1, 'dk'),
	(81, 1, 'dk'),
	(82, 1, 'dk'),
	(83, 1, 'dk'),
	(84, 1, 'dk'),
	(85, 1, 'dk'),
	(86, 1, 'dk'),
	(87, 1, 'dk'),
	(88, 1, 'dk'),
	(89, 1, 'dk'),
	(90, 1, 'dk'),
	(91, 1, 'dk'),
	(92, 1, 'dk'),
	(93, 1, 'dk'),
	(94, 1, 'dk'),
	(95, 1, 'dk'),
	(96, 1, 'dk'),
	(97, 1, 'dk'),
	(98, 1, 'dk'),
	(99, 1, 'dk'),
	(100, 1, 'dk'),
	(101, 1, 'dk'),
	(102, 1, 'dk'),
	(103, 1, 'dk'),
	(104, 1, 'dk'),
	(105, 1, 'dk'),
	(106, 1, 'dk'),
	(107, 1, 'dk'),
	(108, 1, 'dk'),
	(109, 1, 'dk'),
	(110, 1, 'dk'),
	(111, 1, 'dk'),
	(112, 1, 'dk'),
	(113, 1, 'dk'),
	(114, 1, 'dk'),
	(115, 1, 'dk'),
	(116, 1, 'dk'),
	(117, 1, 'dk'),
	(118, 1, 'dk'),
	(119, 1, 'dk'),
	(120, 1, 'dk'),
	(121, 1, 'dk'),
	(122, 1, 'dk'),
	(123, 1, 'dk'),
	(124, 1, 'dk'),
	(125, 1, 'dk'),
	(126, 1, 'dk'),
	(127, 1, 'dk');

insert into SaleDetail (saleId, ingId, qty, unit) values
	(59, 10, 1, 'bottle'),  -- 10 coke
	(60, 10, 1, 'bottle'),
	(61, 10, 1, 'bottle'),
	(62, 10, 1, 'bottle'),
	(63, 10, 1, 'bottle'),
	(64, 10, 1, 'bottle'),
	(65, 10, 1, 'bottle'),
	(66, 10, 1, 'bottle'),
	(67, 10, 1, 'bottle'),
	(68, 10, 1, 'bottle'),

	(69, 11, 1, 'bottle'),  -- 22 sprite
	(70, 11, 1, 'bottle'),
	(71, 11, 1, 'bottle'),
	(72, 11, 1, 'bottle'),
	(73, 11, 1, 'bottle'),
	(74, 11, 1, 'bottle'),
	(75, 11, 1, 'bottle'),
	(76, 11, 1, 'bottle'),
	(77, 11, 1, 'bottle'),
	(78, 11, 1, 'bottle'),
	(79, 11, 1, 'bottle'),
	(80, 11, 1, 'bottle'),
	(81, 11, 1, 'bottle'),
	(82, 11, 1, 'bottle'),
	(83, 11, 1, 'bottle'),
	(84, 11, 1, 'bottle'),
	(85, 11, 1, 'bottle'),
	(86, 11, 1, 'bottle'),
	(87, 11, 1, 'bottle'),
	(88, 11, 1, 'bottle'),
	(89, 11, 1, 'bottle'),
	(90, 11, 1, 'bottle'),

	(91, 12, 1, 'bottle'),  -- 37 water
	(92, 12, 1, 'bottle'),
	(93, 12, 1, 'bottle'),
	(94, 12, 1, 'bottle'),
	(95, 12, 1, 'bottle'),
	(96, 12, 1, 'bottle'),
	(97, 12, 1, 'bottle'),
	(98, 12, 1, 'bottle'),
	(99, 12, 1, 'bottle'),
	(100, 12, 1, 'bottle'),
	(101, 12, 1, 'bottle'),
	(102, 12, 1, 'bottle'),
	(103, 12, 1, 'bottle'),
	(104, 12, 1, 'bottle'),
	(105, 12, 1, 'bottle'),
	(106, 12, 1, 'bottle'),
	(107, 12, 1, 'bottle'),
	(108, 12, 1, 'bottle'),
	(109, 12, 1, 'bottle'),
	(110, 12, 1, 'bottle'),
	(111, 12, 1, 'bottle'),
	(112, 12, 1, 'bottle'),
	(113, 12, 1, 'bottle'),
	(114, 12, 1, 'bottle'),
	(115, 12, 1, 'bottle'),
	(116, 12, 1, 'bottle'),
	(117, 12, 1, 'bottle'),
	(118, 12, 1, 'bottle'),
	(119, 12, 1, 'bottle'),
	(120, 12, 1, 'bottle'),
	(121, 12, 1, 'bottle'),
	(122, 12, 1, 'bottle'),
	(123, 12, 1, 'bottle'),
	(124, 12, 1, 'bottle'),
	(125, 12, 1, 'bottle'),
	(126, 12, 1, 'bottle'),
	(127, 12, 1, 'bottle');



/* 2.4 Quote */
insert into Supplier (supplierId, supplierName, street, city, state, postalCode, country) values
	(1, 'Houston’s Best Food', '934 University Blvd', 'Houston', 'TX', '77005', 'USA'),
	(2, 'Local Premium Food', '101 Main St', 'Houston', 'TX', '77004', 'USA'),
	(3, 'Best Food in Canada', '735 First Ave.', 'Toronto', 'Ontario', 'M4B 1B5', 'Canada'),
	(4, 'LA Ice Cream Supply', '535 King St.', 'Lake Charles', 'LA', '70601', 'USA');
insert into LocalSupplier (supplierId, mileageCost, distance) values
	(1, 0.75, 6),
	(2, 1.10, 32);
insert into NationalSupplier (supplierId, transportFee) values
	(3, 10),
	(4, 12);

insert into ingQuote (quoteId, supplierId, issueDate, expirationDate, tax, fees) values
	(1, 1, '2018-02-02', '2018-02-10', 5.98, 7),
	(2, 2, '2018-02-03', '2018-02-09', 6.35, 5);
insert into Ingredient (ingId, ingName, category) values
	(20,  'strawberry', 'fruit');
insert into quoteItem (quoteId, ingId, qty, unitCost, unit) values
	(1, 20, 20, 2, 'pound'),
	(1, 6, 5, 3.00, 'gallon'),
	(1, 5, 5, 3.50, 'gallon'),
	(2, 20, 25, 1.75, 'pound'),
	(2, 6, 5, 3.20, 'gallon'),
	(2, 5, 5, 3.45, 'gallon');



/* 3 Short answer question */
/* 3.0.1 */
/* Numeric. Because sometimes the value of these attributes can have decimals. To ensure the accuracy during calculation, we can use 'numeric' and specify its precision and scale, so that we can perform calculation exactly. */ 
-- And also precision and scale will be automatically specified according to the data inserted.

/* 3.0.2 */
-- Advantage: Since one ingredient can belong to different categories with the same ingredient name, it is helpful to distinguish them under this circumstance.
-- Disadvantage: It takes extra space to store information.

/* 3.0.3 */
/* The combination of equipmentName and description. */

/* 3.0.4 */
/* Then we need insert more data into table 'Equipment', since there will be more equiments with different names in order to distinguish them.  */

/* 3.0.5 */
/* Chocolate */




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

								