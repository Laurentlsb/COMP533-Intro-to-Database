-- Create Tables
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

drop table if exists MaintenanceLog,
drop table if exists Maintenance,
drop table if exists Equipment,
drop table if exists InventoryItem,
drop table if exists Delivery,
drop table if exists quoteItem,
drop table if exists ingQuote,
drop table if exists NationalSupplier,
drop table if exists LocalSupplier,
drop table if exists SupplierPhone, 
drop table if exists Supplier,
drop table if exists SaleDetail,
drop table if exists Sale,
drop table if exists truckEvent,
drop table if exists Recipe,
drop table if exists Ingredient,
drop table if exists ProductPrice,
drop table if exists Product;