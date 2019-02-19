drop view if exists prod;
DROP TABLE IF EXISTS productPrice;
DROP TABLE IF EXISTS recipe;
DROP TABLE IF EXISTS quoteItem;
DROP TABLE IF EXISTS delivery;
DROP TABLE IF EXISTS inventoryItem;
DROP TABLE IF EXISTS ingQuote;
DROP TABLE IF EXISTS supplierPhone;
DROP TABLE IF EXISTS localSupplier;
DROP TABLE IF EXISTS nationalSupplier;
DROP TABLE IF EXISTS saleDetail;
DROP TABLE IF EXISTS maintenance;
DROP TABLE IF EXISTS maintenanceLog;
DROP TABLE IF EXISTS equipment;
DROP TABLE IF EXISTS supplier;
DROP TABLE IF EXISTS sale;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS ingredient;
DROP TABLE IF EXISTS xtra;
DROP TABLE IF EXISTS todo;
DROP TABLE IF EXISTS eventlog;
DROP TABLE IF EXISTS truckEvent;

/* find dependencies
SELECT
	n1.nspname AS primary_key_ns,
	c1.relname AS primary_key_table,
	n2.nspname AS foreign_key_ns,
	c2.relname AS foreign_key_table
FROM pg_catalog.pg_constraint c
JOIN ONLY pg_catalog.pg_class c1     ON c1.oid = c.confrelid
JOIN ONLY pg_catalog.pg_class c2     ON c2.oid = c.conrelid
JOIN ONLY pg_catalog.pg_namespace n1 ON n1.oid = c1.relnamespace
JOIN ONLY pg_catalog.pg_namespace n2 ON n2.oid = c2.relnamespace
WHERE c1.relkind = 'r' AND c.contype = 'f'
ORDER BY 1,2,3,4;
*/

-- 1 Create Tables

-- 1.1 Product - created
drop table if exists Product; 
create table Product (
	productCode CHAR(3) not null,
    productName VARCHAR(50) not null,
    isAvailable INTEGER DEFAULT 1,
    unique (productName),
    primary key (productCode)
); 

-- 1.2 ProductPrice - created
drop table if exists ProductPrice;
create table ProductPrice(
	productCode CHAR(3) not null,
    startDate date not null,
    cost numeric(10,2) default null,
    price numeric(10,2) default null,
    foreign key (productCode) references Product(productCode),
    primary key (productCode, startDate)
);

-- 1.3 Ingredient - created
drop table if exists Ingredient;
create table Ingredient(
	ingId serial,
    ingName varchar(50) not null,
    category varchar(50) not null,
    unique (ingName, category),
    primary key (ingId)
);

-- 1.4 Recipe - created
drop table if exists Recipe;
create table Recipe(
	productCode CHAR(3) not null,
    ingID int not null,
    qty numeric(10,2) not null,
    unit varchar(20) not null,
    foreign key (productCode) references Product(productCode),
    foreign key (ingId) references Ingredient(ingId),
    primary key (productCode, ingId)
);

-- 1.5 truckEvent - created
drop table if exists truckEvent;
create table truckEvent(
	eventId serial,
    eventName varchar(200) not null,
    eventStart timestamp not null,
    plannedEnd timestamp  null,
    actualEnd timestamp  null,
    unique (eventName, eventStart),
    primary key (eventId)
);

-- 1.6 Sale - created
drop table if exists Sale;
create table Sale (
	saleId serial,
    eventId int not null,
    productCode CHAR(3) not null,
    partOfSale INTEGER null,
    foreign key (eventId) references truckEvent(eventId),
    foreign key (productCode) references Product(productCode),
    primary key (saleId)
);

-- 1.7 SaleDetail - created
drop table if exists SaleDetail;
create table SaleDetail(
    saleDetailId SERIAL,
    saleId int not null,
    ingId int not null,
    qty numeric(10,2) not null,
    unit varchar(20) not null,
    foreign key (saleId) references Sale(saleId),
    foreign key (ingId) references Ingredient(ingId),
    primary key (saleDetailId)
);


-- 1.8 Supplier - created
drop table if exists Supplier;
create table Supplier(
	supplierId serial,
    supplierName varchar(150) not null,
    street varchar(150) not null,
    city varchar(150) not null,
    state varchar(50) not null,
    postalCode varchar(15) not null,
    country varchar(150) not null,
    unique (supplierName, street, city),
    primary key (supplierId)
);

-- 1.9 SupplierPhone - created
drop table if exists SupplierPhone;
create table SupplierPhone(
	supplierId int not null,
    phoneType varchar(50) not null,
    phoneNumber varchar(20) default null,
    foreign key (supplierId) references Supplier(supplierId),
    primary key (supplierId, phoneType)
);

-- 1.10 LocalSupplier - created
drop table if exists LocalSupplier;
create table LocalSupplier(
	supplierId int not null,
    mileageCost numeric(10,3) not null,
    distance numeric(10,2) not null,
    foreign key (supplierId) references Supplier(supplierId),
    primary key (supplierId)
);

-- 1.11 NationalSupplier - created
drop table if exists NationalSupplier;
create table NationalSupplier(
	supplierId int not null,
    transportFee numeric(10,2) not null,
	foreign key (supplierId) references Supplier(supplierId),
    primary key (supplierId)
);

-- 1.12 ingQuote - created
drop table if exists ingQuote;
create table ingQuote(
	quoteId serial,
    supplierId int not null,
    issueDate date not null,
    expirationDate date not null,
    tax numeric(10,2) not null,
    fees numeric(10,2) not null,
    total numeric(10,2) default null,
    unique (supplierId, issueDate),
    foreign key (supplierId) references Supplier(supplierId),
    primary key (quoteId)
);

-- 1.13 quoteItem - created
drop table if exists quoteItem;
create table quoteItem(
	quoteId int not null,
    ingId int not null,
    qty numeric(10,2) not null,
    unitCost numeric(12,2) not null,
    unit varchar(20) not null,
    foreign key (quoteId) references ingQuote(quoteId),
    foreign key (ingId) references Ingredient(ingId),
	primary key (quoteId, ingId)
);


-- 1.14 Delivery - created
drop table if exists Delivery;
create table Delivery(
	deliveryId serial,
    quoteId int not null,
    orderDate date not null,
    deliveryDate date default null,
    foreign key (quoteId) references ingQuote(quoteId),
    primary key (deliveryId)
);

-- 1.15 inventoryItem - created
drop table if exists inventoryItem;
create table inventoryItem(
	ingId int not null,
    quoteId int not null,
    expirationDate date default null,
    stockQty numeric(10,2) not null,
    unit varchar(20) not null,
    qtyRemaining numeric(10,2) default null,
    foreign key (quoteId) references ingQuote(quoteId),
    foreign key (ingId) references Ingredient(ingId),
    primary key (ingId, quoteId)
);


-- 1.16 Equipment - created
drop table if exists Equipment;
create table Equipment(
	equipmentName varchar(50) not null,
    installDate date not null,
    primary key (equipmentName)
);

-- 1.17 Maintenance - created
drop table if exists Maintenance;
create table Maintenance(
	maintId serial,
    equipmentName varchar(50) not null,
    name varchar(150) default null,
    timingTrigger VARCHAR(30) not null,
    triggerQty int not null,
    triggerUnit varchar(20) not null,
    minutes int not null,
    foreign key (equipmentName) references Equipment(equipmentName),
    primary key (maintId)
);

-- 1.18 MaintenanceLog - created
drop table if exists MaintenanceLog;
create table MaintenanceLog(
	maintId int not null,
    datePerformed date not null,
    minutes int default null,
    notes text default null,
    primary key (maintId, datePerformed)
);

CREATE TABLE IF NOT EXISTS xtra(
	productCode CHAR(3),
	xtraCode CHAR(3),
	PRIMARY KEY (productCode)
);

CREATE TABLE IF NOT EXISTS productType(
	productCode CHAR(3),
	productType VARCHAR(20),
	PRIMARY KEY (productCode)
);

CREATE TABLE IF NOT EXISTS productTypePairs(
	productType1 VARCHAR(20),
	productType2 VARCHAR(20),
	productCount INTEGER,
	PRIMARY KEY (productType1, productType2)
);

CREATE TABLE IF NOT EXISTS eventLog(
	eventId INTEGER,
	actualStart TIMESTAMP NOT NULL,
	minutesDuration DECIMAL(5,2) NOT NULL,
	PRIMARY KEY (eventId),
	FOREIGN KEY(eventId) REFERENCES truckEvent(eventId)
);


CREATE TABLE IF NOT EXISTS toDo(
	toDoId SERIAL,
	id INTEGER, 
	toDoType VARCHAR(20) NOT NULL,
	recorded TIMESTAMP NOT NULL,
	done BOOLEAN DEFAULT FALSE,
	PRIMARY KEY (toDoId)
);