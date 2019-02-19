
INSERT INTO product(productCode, productName) VALUES
-- cones
('c1', 'kid cone'),
('c2', 'regular cone'),
('c3', 'large cone'),
('cx', 'extra cone topping'),
('wc', 'waffle cone'),
('mt', 'monkey tail'),
-- dishes
('d1', 'Kid dish'),
('d2', 'regular dish'),
('d3', 'large dish'),
('dx', 'extra dish topping'),
-- slushies
('sl1', 'kid slush'),
('sl2', 'regular slush'),
('sl3', 'large slush'),
('slx', 'extra slush topping'),
('bf', 'brain freeze'),
-- drinks
('fl', 'float'),
('dk', 'drink'),
('ms', 'milkshake'),
-- sundaes
('b', 'brownie sundae'),
('ss', 'strawberry shortcake'),
('ts', 'turtle sundae'),
('bs', 'banana split'),
('sx', 'extra sundae topping'),
('s1', 'regular sundae'),
('s2', 'large sundae'),
-- other
('pt', 'pint'),
-- missed one
('wx', 'extra waffle topping');


INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('b', '2017-12-01', 5, 7.5);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('bf', '2017-12-01', 4.2, 5.5);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('bs', '2017-12-01', 4.5, 6.5);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('c1', '2017-12-01', 2, 3);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('c2', '2017-12-01', 2.75, 4);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('c3', '2017-12-01', 3.5, 5);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('cx', '2017-12-01', 0.1, 0.5);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('d1', '2017-12-01', 2, 3);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('d2', '2017-12-01', 2.75, 4);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('d3', '2017-12-01', 3.5, 5);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('dk', '2017-12-01', 0.44, 0.75);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('dx', '2017-12-01', 0.15, 0.25);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('fl', '2017-12-01', 4, 6);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('ms', '2017-12-01', 4, 6);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('mt', '2017-12-01', 2.5, 5);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('pt', '2017-12-01', 4, 6);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('s1', '2017-12-01', 3.5, 5);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('s2', '2017-12-01', 4, 6);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('sl1', '2017-12-01', 0.5, 3);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('sl2', '2017-12-01', 0.75, 4);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('sl3', '2017-12-01', 1, 5);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('slx', '2017-12-01', 0.05, 0.25);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('ss', '2017-12-01', 5, 7);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('sx', '2017-12-01', 0.25, 0.5);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('ts', '2017-12-01', 5, 7);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('wc', '2017-12-01', 4, 6);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('wx', '2017-12-01', 0.25, 0.5);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('b', '2018-01-01', 5, 8);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('bf', '2018-01-01', 4.2, 6);
INSERT INTO productPrice(productCode, startDate, cost, price) VALUES ('bs', '2018-01-01', 5, 7);

INSERT INTO ingredient(ingId, ingName, category) VALUES (1, 'vanilla', 'ice cream base');
INSERT INTO ingredient(ingId, ingName, category) VALUES (2, 'chocolate', 'ice cream base');
INSERT INTO ingredient(ingId, ingName, category) VALUES (3, 'strawberry', 'flavor');
INSERT INTO ingredient(ingId, ingName, category) VALUES (4, 'blue raspberry', 'flavor');
INSERT INTO ingredient(ingId, ingName, category) VALUES (5, 'cherry', 'flavor');
INSERT INTO ingredient(ingId, ingName, category) VALUES (6, 'grape', 'flavor');
INSERT INTO ingredient(ingId, ingName, category) VALUES (7, 'lemon', 'flavor');
INSERT INTO ingredient(ingId, ingName, category) VALUES (8, 'lime', 'flavor');
INSERT INTO ingredient(ingId, ingName, category) VALUES (9, 'watermelon', 'flavor');
INSERT INTO ingredient(ingId, ingName, category) VALUES (10, 'pineapple', 'topping');
INSERT INTO ingredient(ingId, ingName, category) VALUES (11, 'strawberry', 'topping');
INSERT INTO ingredient(ingId, ingName, category) VALUES (12, 'sprinkles', 'topping');
INSERT INTO ingredient(ingId, ingName, category) VALUES (13, 'peanuts', 'topping');
INSERT INTO ingredient(ingId, ingName, category) VALUES (14, 'oreo', 'topping');
INSERT INTO ingredient(ingId, ingName, category) VALUES (15, 'caramel', 'topping');
INSERT INTO ingredient(ingId, ingName, category) VALUES (16, 'PB cup', 'topping');
INSERT INTO ingredient(ingId, ingName, category) VALUES (17, 'brownie', 'baked good');
INSERT INTO ingredient(ingId, ingName, category) VALUES (18, 'biscuit', 'baked good');
INSERT INTO ingredient(ingId, ingName, category) VALUES (19, 'cookie', 'novelty');
INSERT INTO ingredient(ingId, ingName, category) VALUES (20, 'short napkin', 'paper goods');
INSERT INTO ingredient(ingId, ingName, category) VALUES (21, 'tall napkin', 'paper goods');
INSERT INTO ingredient(ingId, ingName, category) VALUES (22, 'short spoon', 'spoon');
INSERT INTO ingredient(ingId, ingName, category) VALUES (23, 'long spoon', 'spoon');
INSERT INTO ingredient(ingId, ingName, category) VALUES (24, '12 oz cup', 'cup');
INSERT INTO ingredient(ingId, ingName, category) VALUES (25, '12 oz lid', 'lid');
INSERT INTO ingredient(ingId, ingName, category) VALUES (26, '20 oz cup', 'cup');
INSERT INTO ingredient(ingId, ingName, category) VALUES (27, '20 oz lid', 'lid');
INSERT INTO ingredient(ingId, ingName, category) VALUES (28, '32 oz cup', 'cup');
INSERT INTO ingredient(ingId, ingName, category) VALUES (29, '32 oz lid', 'lid');
INSERT INTO ingredient(ingId, ingName, category) VALUES (30, '6 oz dish', 'cup');
INSERT INTO ingredient(ingId, ingName, category) VALUES (31, '10 oz dish', 'cup');
INSERT INTO ingredient(ingId, ingName, category) VALUES (32, '12 oz dish', 'cup');
INSERT INTO ingredient(ingId, ingName, category) VALUES (33, '16 oz dish', 'cup');
INSERT INTO ingredient(ingId, ingName, category) VALUES (34, '#10 cone', 'cone');
INSERT INTO ingredient(ingId, ingName, category) VALUES (35, '#30 cone', 'cone');
INSERT INTO ingredient(ingId, ingName, category) VALUES (36, 'waffle cone', 'cone');
INSERT INTO ingredient(ingId, ingName, category) VALUES (37, 'sugar', 'ingredient');
INSERT INTO ingredient(ingId, ingName, category) VALUES (38, 'coke', 'beverage');
INSERT INTO ingredient(ingId, ingName, category) VALUES (39, 'sprite', 'beverage');
INSERT INTO ingredient(ingId, ingName, category) VALUES (40, 'water', 'beverage');
INSERT INTO ingredient(ingId, ingName, category) VALUES (41, 'dr. pepper', 'beverage');
INSERT INTO ingredient(ingId, ingName, category) VALUES (42, 'rootbeer', 'beverage');
INSERT INTO ingredient(ingId, ingName, category) VALUES (43, 'milk', 'ingredient');
INSERT INTO ingredient(ingId, ingName, category) VALUES (44, 'pint', 'cup');
INSERT INTO ingredient(ingId, ingName, category) VALUES (45, 'whipped cream', 'topping');
INSERT INTO ingredient(ingId, ingName, category) VALUES (46, 'cherry', 'topping');
INSERT INTO ingredient(ingId, ingName, category) VALUES (47, 'banana', 'fruit');
INSERT INTO ingredient(ingId, ingName, category) VALUES (48, 'monkey tail', 'novelty');
INSERT INTO ingredient(ingId, ingName, category) VALUES (49, 'short straw', 'straw');
INSERT INTO ingredient(ingId, ingName, category) VALUES (50, 'tall straw', 'straw');
INSERT INTO ingredient(ingId, ingName, category) VALUES (51, 'hot fudge', 'topping');
INSERT INTO ingredient(ingId, ingName, category) VALUES (52, 'pecans', 'topping');
INSERT INTO ingredient(ingId, ingName, category) VALUES (53, 'stem cherry', 'topping');
INSERT INTO ingredient(ingId, ingName, category) VALUES (54, 'ice cream base', 'option');
INSERT INTO ingredient(ingId, ingName, category) VALUES (55, 'slushie base', 'ingredient');
INSERT INTO ingredient(ingId, ingName, category) VALUES (56, 'flavor', 'option');
INSERT INTO ingredient(ingId, ingName, category) VALUES (57, 'topping', 'option');
INSERT INTO ingredient(ingId, ingName, category) VALUES (58, 'beverage', 'option');

INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('b', 33, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('b', 17, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('b', 51, 1.5, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('b', 52, 1.5, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('b', 22, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('b', 53, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('b', 21, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('b', 45, 1.5, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('bf', 26, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('bf', 23, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('bf', 50, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('bs', 33, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('bs', 47, 4, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('bs', 51, 1.5, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('bs', 52, 1.5, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('bs', 10, 4, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('bs', 22, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('bs', 53, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('bs', 11, 4, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('bs', 21, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('bs', 45, 1.5, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('c1', 34, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('c1', 20, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('c2', 35, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('c2', 20, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('c3', 35, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('c3', 20, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('d1', 30, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('d1', 22, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('d1', 21, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('d2', 31, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('d2', 22, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('d2', 21, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('d3', 32, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('d3', 22, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('d3', 21, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('fl', 26, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('fl', 23, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('fl', 50, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('ms', 26, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('ms', 27, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('ms', 23, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('ms', 43, 0.75, 'cup');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('ms', 21, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('ms', 50, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('mt', 48, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('s1', 31, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('s1', 22, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('s1', 53, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('s1', 21, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('s1', 45, 1, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('s2', 32, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('s2', 22, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('s2', 53, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('s2', 21, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('s2', 45, 1.5, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('sl1', 24, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('sl1', 25, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('sl1', 49, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('sl1', 21, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('sl2', 26, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('sl2', 27, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('sl2', 49, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('sl2', 21, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('sl3', 28, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('sl3', 29, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('sl3', 21, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('sl3', 50, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('ss', 33, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('ss', 18, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('ss', 22, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('ss', 53, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('ss', 11, 4, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('ss', 21, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('ss', 45, 1.5, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('ts', 33, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('ts', 15, 1.5, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('ts', 51, 1.5, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('ts', 52, 1.5, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('ts', 22, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('ts', 53, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('ts', 21, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('ts', 45, 1.5, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('wc', 20, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('wc', 36, 1, 'item');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('b', 54, 6, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('bf', 54, 5, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('bf', 55, 18, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('bs', 54, 8, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('c1', 57, 1, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('c1', 54, 3, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('c2', 57, 1.5, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('c2', 54, 6, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('c3', 57, 2, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('c3', 54, 8, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('cx', 57, 1, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('d1', 57, 1, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('d1', 54, 3, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('d2', 57, 1.5, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('d2', 54, 6, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('d3', 57, 2, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('d3', 54, 8, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('dk', 58, 1, 'can');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('dx', 57, 1, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('fl', 54, 6, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('fl', 58, 1, 'can');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('ms', 57, 1, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('ms', 54, 6, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('s1', 57, 1, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('s1', 54, 6, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('s2', 57, 1.5, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('s2', 54, 8, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('sl1', 56, 0.25, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('sl1', 55, 12, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('sl2', 56, 0.5, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('sl2', 55, 20, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('sl3', 56, 0.75, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('sl3', 55, 32, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('slx', 56, 0.5, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('ss', 54, 6, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('sx', 57, 5, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('ts', 54, 8, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('wc', 57, 1.5, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('wc', 54, 6, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('wx', 57, 1, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('bf', 56, 0.5, 'ounce');
INSERT INTO recipe(productCode, ingId, qty, unit) VALUES ('pt', 54, 16, 'ounce');

INSERT INTO supplier(supplierId, supplierName, street, city, state, postalcode, country) VALUES ('1', 'Best Food', '1 Main St.', 'Springfield', 'MA', '01234', 'USA');
INSERT INTO supplier(supplierId, supplierName, street, city, state, postalcode, country) VALUES ('2', 'Canada''s Best Food', '735 First Ave.', 'Toronto', 'Ontario', 'M4B 1B5', 'Canada');
INSERT INTO supplier(supplierId, supplierName, street, city, state, postalcode, country) VALUES ('3', 'Mexico''s Best Food', '4590 King St.', 'Mexico City', 'CDMX', '', 'Mexico');
INSERT INTO supplier(supplierId, supplierName, street, city, state, postalcode, country) VALUES ('4', 'Houston Best Food', '934 University Blvd', 'Houston', 'TX', '77005', 'USA');

INSERT INTO supplierPhone(supplierId, phoneType, phoneNumber) VALUES (1, 'main', '(456)555-1234');
INSERT INTO supplierPhone(supplierId, phoneType, phoneNumber) VALUES (1, 'fax', '(456)555-1235');
INSERT INTO supplierPhone(supplierId, phoneType, phoneNumber) VALUES (2, 'main', '011-226-222-4456');
INSERT INTO supplierPhone(supplierId, phoneType, phoneNumber) VALUES (2, 'fax', '011-226-222-4470');
INSERT INTO supplierPhone(supplierId, phoneType, phoneNumber) VALUES (3, 'main', '011-52-624-143-1234');
INSERT INTO supplierPhone(supplierId, phoneType, phoneNumber) VALUES (3, 'fax', '011-52-624-143-1200');
INSERT INTO supplierPhone(supplierId, phoneType, phoneNumber) VALUES (4, 'main', '(713)555-9876');
INSERT INTO supplierPhone(supplierId, phoneType, phoneNumber) VALUES (4, 'fax', '(713)555-9873');

INSERT INTO nationalSupplier(supplierId, transportFee) VALUES (2, 10);
INSERT INTO nationalSupplier(supplierId, transportFee) VALUES (3, 20);
INSERT INTO localSupplier(supplierId, distance, mileageCost) VALUES (1, 15, 0.435);
INSERT INTO localSupplier(supplierId, distance, mileageCost) VALUES (4, 10, 0.25);

INSERT INTO ingQuote(quoteId, supplierId, issueDate, expirationDate, tax, fees, total) VALUES (1, 1, '2018-01-10', '2018-02-20', 67.12, 2, 60);
INSERT INTO ingQuote(quoteId, supplierId, issueDate, expirationDate, tax, fees, total) VALUES (2, 1, '2018-01-11', '2018-02-17', 66.47, 10, 51.4);

INSERT INTO quoteItem(quoteId, ingId, qty,unit, unitcost) VALUES (1, 1, 30, 'pounds', 30);
INSERT INTO quoteItem(quoteId, ingId, qty,unit, unitcost) VALUES (1, 2, 30, 'pounds', 30);
INSERT INTO quoteItem(quoteId, ingId, qty,unit, unitcost) VALUES (2, 3, 1, 'gallon', 7.5);
INSERT INTO quoteItem(quoteId, ingId, qty,unit, unitcost) VALUES (2, 4, 1, 'gallon', 7);
INSERT INTO quoteItem(quoteId, ingId, qty,unit, unitcost) VALUES (2, 5, 1, 'gallon', 7);
INSERT INTO quoteItem(quoteId, ingId, qty,unit, unitcost) VALUES (2, 6, 1, 'gallon', 6.4);
INSERT INTO quoteItem(quoteId, ingId, qty,unit, unitcost) VALUES (2, 7, 1, 'gallon', 7.5);
INSERT INTO quoteItem(quoteId, ingId, qty,unit, unitcost) VALUES (2, 8, 1, 'gallon', 8);
INSERT INTO quoteItem(quoteId, ingId, qty,unit, unitcost) VALUES (2, 9, 1, 'gallon', 8);

INSERT INTO delivery(deliveryId, quoteId, orderDate, deliveryDate) VALUES (1, 1, '2018-01-12', '2018-01-15');
INSERT INTO delivery(deliveryId, quoteId, orderDate, deliveryDate) VALUES (2, 2, '2018-01-15', NULL);

INSERT INTO inventoryItem(ingId, quoteId, expirationDate, stockQty, unit) VALUES (1, 1, '2018-02-15', 30, 'pounds');


INSERT INTO equipment(equipmentName, installDate) VALUES ('truck', '2017-11-15');
INSERT INTO equipment(equipmentName, installDate) VALUES ('generator', '2017-11-15');
INSERT INTO equipment(equipmentName, installDate) VALUES ('ice cream machine 1', '2017-11-15');
INSERT INTO equipment(equipmentName, installDate) VALUES ('ice cream machine 2', '2017-11-15');
INSERT INTO equipment(equipmentName, installDate) VALUES ('slushie machine', '2017-11-15');
INSERT INTO equipment(equipmentName, installDate) VALUES ('whipped cream machine', '2017-11-15');
INSERT INTO equipment(equipmentName, installDate) VALUES ('mixer', '2017-11-15');

INSERT INTO maintenance(maintId, equipmentName, name, timingTrigger, triggerQty, triggerUnit, minutes) VALUES (1,'generator', 'refuel', 'after', 40, 'hour', 10);
INSERT INTO maintenance(maintId, equipmentName, name, timingTrigger, triggerQty, triggerUnit, minutes) VALUES (2,'generator', 'oil & filter change', 'after', 200, 'hour', 60);
INSERT INTO maintenance(maintId, equipmentName, name, timingTrigger, triggerQty, triggerUnit, minutes) VALUES (3,'generator', 'full maintenance', 'after', 1000, 'hour', 120);
INSERT INTO maintenance(maintId, equipmentName, name, timingTrigger, triggerQty, triggerUnit, minutes) VALUES (4,'truck', 'clean', 'after', 1, 'event', 30);
INSERT INTO maintenance(maintId, equipmentName, name, timingTrigger, triggerQty, triggerUnit, minutes) VALUES (5,'truck', 'full clean', 'after', 1, 'week', 120);
INSERT INTO maintenance(maintId, equipmentName, name, timingTrigger, triggerQty, triggerUnit, minutes) VALUES (6,'ice cream machine 1', 'clean', 'after', 1, 'week', 120);
INSERT INTO maintenance(maintId, equipmentName, name, timingTrigger, triggerQty, triggerUnit, minutes) VALUES (7,'ice cream machine 2', 'clean', 'after', 1, 'week', 120);
INSERT INTO maintenance(maintId, equipmentName, name, timingTrigger, triggerQty, triggerUnit, minutes) VALUES (8,'whipped cream machine', 'clean', 'after', 1, 'week', 60);
INSERT INTO maintenance(maintId, equipmentName, name, timingTrigger, triggerQty, triggerUnit, minutes) VALUES (9,'truck', 'water change', 'before', 1, 'event', 60);
INSERT INTO maintenance(maintId, equipmentName, name, timingTrigger, triggerQty, triggerUnit, minutes) VALUES (10,'mixer', 'clean', 'after', 1, 'product', 1);
INSERT INTO maintenance(maintId, equipmentName, name, timingTrigger, triggerQty, triggerUnit, minutes) VALUES (11,'ice cream machine 1', 'post event clean', 'after', 1, 'event', 10);
INSERT INTO maintenance(maintId, equipmentName, name, timingTrigger, triggerQty, triggerUnit, minutes) VALUES (12,'ice cream machine 2', 'post event clean', 'after', 1, 'event', 10);

INSERT INTO maintenanceLog(maintId, datePerformed, minutes, notes) VALUES (4, '2017-12-01', 35, 'slow event, not much time needed');
INSERT INTO maintenanceLog(maintId, datePerformed, minutes, notes) VALUES (4, '2017-12-02', 120, 'normal');
INSERT INTO maintenanceLog(maintId, datePerformed, minutes, notes) VALUES (1, '2017-12-02', 10, 'get more diesel!');

INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (1, 'GSA Coffee Break', '2017-01-19 13:00:00', '2017-01-19 15:30:00','2017-01-19 15:40:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (2, 'GSA Coffee Break', '2017-02-02 15:00:00', '2017-02-02 16:30:00','2017-02-02 16:35:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (3, 'GSA Coffee Break', '2017-02-23 13:00:00', '2017-02-23 15:30:00','2017-02-23 15:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (4, 'GSA Coffee Break', '2017-03-09 15:00:00', '2017-03-09 16:30:00','2017-03-09 16:30:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (5, 'Valhalloween', '2016-10-31 19:00:00', '2016-11-01 2:00:00','2016-11-01 2:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (6, 'GSA Picnic', '2017-03-31 19:00:00', '2017-03-31 23:59:00','2017-03-31 23:59:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (7, 'GSA Study Break', '2017-02-16 19:00:00', '2017-02-16 21:00:00','2017-02-16 21:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (8, 'Commencement', '2017-05-13 10:00:00', '2017-05-13 16:00:00','2017-05-13 16:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (9, 'Hooding', '2017-06-16 14:00:00', '2017-06-16 16:00:00','2017-06-16 16:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (10, 'Pi Day', '2017-03-14 11:00:00', '2017-03-14 13:00:00','2017-03-14 13:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (11, 'Wedding', '2017-08-19 17:00:00', '2017-08-19 23:00:00','2017-08-19 23:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (12, 'Baker College Study Break', '2017-04-03 19:00:00', '2017-04-03 21:00:00','2017-04-03 21:30:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (13, 'Brown College Study Break', '2017-04-07 19:00:00', '2017-04-07 21:00:00','2017-04-07 21:35:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (14, 'Duncan College Study Break', '2017-04-05 19:00:00', '2017-04-05 21:00:00','2017-04-05 21:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (15, 'Hanszen College Study Break', '2017-04-06 19:00:00', '2017-04-06 21:00:00','2017-04-06 21:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (16, 'Jones College Study Break', '2017-04-12 19:00:00', '2017-04-12 21:00:00','2017-04-12 21:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (17, 'Lovett College Study Break', '2017-04-13 19:00:00', '2017-04-13 21:00:00','2017-04-13 21:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (18, 'Martel College Study Break', '2017-04-14 19:00:00', '2017-04-14 21:00:00','2017-04-14 21:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (19, 'McMurty College Study Break', '2017-04-15 14:00:00', '2017-04-15 17:00:00','2017-04-15 17:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (20, 'GSA Study Break', '2017-04-15 19:00:00', '2017-04-15 22:00:00','2017-04-15 22:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (21, 'Sid Richardson College Study Break', '2017-04-27 19:00:00', '2017-04-27 21:00:00','2017-04-27 20:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (22, 'Weiss College Study Break', '2017-04-26 19:00:00', '2017-04-26 21:00:00','2017-04-26 21:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (23, 'Will Rice College Study Break', '2017-03-29 19:00:00', '2017-03-29 21:00:00','2017-03-29 21:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (24, 'Career Fair', '2017-03-16 10:00:00', '2017-03-16 16:00:00','2017-03-16 16:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (25, 'Data Science Conference', '2017-02-20 12:00:00', '2017-02-20 16:00:00','2017-02-20 16:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (26, '90 Second Thesis Competition', '2017-04-20 19:00:00', '2017-04-20 21:00:00','2017-04-20 21:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (27, 'Valhalla Food Truck Night', '2017-06-15 16:00:00', '2017-06-15 21:00:00','2017-06-15 21:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (28, 'Jones Food Truck Night', '2017-06-22 16:00:00', '2017-06-22 21:00:00','2017-06-22 21:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (29, 'BRC Food Truck Night', '2017-06-29 16:00:00', '2017-06-29 21:00:00','2017-06-29 21:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (30, 'RGA Food Truck Night', '2017-07-12 16:00:00', '2017-07-12 21:00:00','2017-07-12 21:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (31, 'Rice Village Apt Food Truck Night', '2017-07-17 16:00:00', '2017-07-17 21:00:00','2017-07-17 21:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (32, 'BRC Blood Drive', '2017-05-05 11:00:00', '2017-05-05 15:00:00','2017-05-05 15:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (33, 'Stone Brewery Tap Takeover', '2017-05-11 16:00:00', '2017-05-12 2:00:00','2017-05-12 2:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (34, 'St. Arnolds Tap Takeover', '2017-05-03 16:00:00', '2017-05-04 2:00:00','2017-05-04 2:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (35, 'Brash Tap Takeover', '2017-05-08 16:00:00', '2017-05-08 2:00:00','2017-05-08 2:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (36, 'Karbach Tap Takeover', '2017-05-17 16:00:00', '2017-05-18 2:00:00','2017-05-18 2:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (37, 'Magic Hat Tap Takeover', '2017-05-24 16:00:00', '2017-05-25 2:00:00','2017-05-25 2:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (38, 'Powder Puff Game', '2017-04-08 15:30:00', '2017-04-08 17:30:00','2017-04-08 17:30:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (39, 'Beer Bike', '2016-04-01 10:00:00', '2016-04-01 11:59:00','2016-04-01 11:59:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (40, 'GSA Culture Night', '2017-03-10 15:30:00', '2017-03-10 23:30:00','2017-03-10 23:30:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (41, 'GSA Spring Picnic', '2017-03-24 15:30:00', '2017-03-24 23:30:00','2017-03-24 23:30:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (42, 'GSA Fall Picnic', '2017-09-15 15:30:00', '2017-09-15 23:30:00','2017-09-15 23:30:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (43, 'Badging', '2017-08-16 8:00:00', '2017-08-16 17:00:00','2017-08-16 17:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (44, 'Art Opening', '2017-01-18 11:30:00', '2017-01-18 23:30:00','2017-01-18 23:30:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (45, 'Performance', '2017-04-28 18:30:00', '2017-04-28 23:30:00','2017-04-28 23:30:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (46, 'GSA Movie Night', '2017-06-14 18:30:00', '2017-06-14 23:00:00','2017-06-14 23:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (47, 'Sid Rich Movie Night', '2017-05-09 18:30:00', '2017-05-09 23:00:00','2017-05-09 23:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (48, 'Hanszen Movie Night', '2017-05-10 18:30:00', '2017-05-10 23:00:00','2017-05-10 23:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (49, 'Orientation Picnic', '2017-08-12 11:30:00', '2017-08-12 14:30:00','2017-08-12 14:30:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (50, 'Activities Fair', '2017-08-12 15:00:00', '2017-08-12 23:00:00','2017-08-12 23:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (51, 'Freshman Visit', '2017-04-04 18:30:00', '2017-04-04 23:00:00','2017-04-04 23:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (52, 'Research Colloquium', '2017-08-30 11:30:00', '2017-08-30 15:00:00','2017-08-30 15:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (53, 'Grad Games', '2017-09-07 18:30:00', '2017-09-07 23:00:00','2017-09-07 23:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (54, 'Study Break', '2017-09-13 17:30:00', '2017-09-13 22:00:00','2017-09-13 22:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (55, 'Football Game', '2017-09-09 13:30:00', '2017-09-09 18:00:00','2017-09-09 18:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (56, 'Partio', '2017-09-22 16:00:00', '2017-09-22 23:00:00','2017-09-22 23:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (57, 'Hackathon', '2017-10-14 11:30:00', '2017-10-14 23:00:00','2017-10-14 23:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (58, 'Sid Rich College Study Break', '2017-04-16 20:00:00', '2017-04-16 23:00:00','2017-04-16 23:00:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (59, 'Weiss College Study Break', '2017-04-09 12:00:00', '2017-04-09 15:30:00','2017-04-09 15:30:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (60, 'CS Study Break', '2017-09-14 15:30:00', '2017-09-14 23:30:00','2017-09-14 23:30:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (61, 'Intramural Sport Xtravaganza', '2017-09-16 10:30:00', '2017-09-16 17:30:00','2017-09-16 17:30:00');
INSERT INTO truckEvent(eventId, eventName, eventStart, plannedEnd, actualEnd) VALUES (62, 'Will Rice College Study Break', '2017-04-10 20:00:00', '2017-04-11 1:30:00','2017-04-11 1:30:00');

INSERT INTO xtra(productCode, xtraCode) VALUES
('b', 'sx'),
('bs', 'sx'),
('s1', 'sx'),
('s2', 'sx'),
('ss', 'sx'),
('ts', 'sx'),
('c1', 'cx'),
('c2', 'cx'),
('c3', 'cx'),
('d1', 'dx'),
('d2', 'dx'),
('d3', 'dx'),
('wc', 'wx'),
('sl1', 'slx'),
('sl2', 'slx'),
('sl3', 'slx');


INSERT INTO PRODUCTTYPE(productCode, productType) VALUES ('bs', 'sundae');
INSERT INTO PRODUCTTYPE(productCode, productType) VALUES ('bf', 'slush');
INSERT INTO PRODUCTTYPE(productCode, productType) VALUES ('b', 'sundae');
INSERT INTO PRODUCTTYPE(productCode, productType) VALUES ('dk', 'beverage');
INSERT INTO PRODUCTTYPE(productCode, productType) VALUES ('cx', 'extra');
INSERT INTO PRODUCTTYPE(productCode, productType) VALUES ('dx', 'extra');
INSERT INTO PRODUCTTYPE(productCode, productType) VALUES ('slx', 'extra');
INSERT INTO PRODUCTTYPE(productCode, productType) VALUES ('sx', 'extra');
INSERT INTO PRODUCTTYPE(productCode, productType) VALUES ('wx', 'extra');
INSERT INTO PRODUCTTYPE(productCode, productType) VALUES ('fl', 'ice cream beverage');
INSERT INTO PRODUCTTYPE(productCode, productType) VALUES ('c1', 'cone');
INSERT INTO PRODUCTTYPE(productCode, productType) VALUES ('d1', 'dish');
INSERT INTO PRODUCTTYPE(productCode, productType) VALUES ('sl1', 'slush');
INSERT INTO PRODUCTTYPE(productCode, productType) VALUES ('c3', 'cone');
INSERT INTO PRODUCTTYPE(productCode, productType) VALUES ('d3', 'dish');
INSERT INTO PRODUCTTYPE(productCode, productType) VALUES ('sl3', 'slush');
INSERT INTO PRODUCTTYPE(productCode, productType) VALUES ('s2', 'sundae');
INSERT INTO PRODUCTTYPE(productCode, productType) VALUES ('ms', 'ice cream beverage');
INSERT INTO PRODUCTTYPE(productCode, productType) VALUES ('mt', 'novelty');
INSERT INTO PRODUCTTYPE(productCode, productType) VALUES ('pt', 'pint');
INSERT INTO PRODUCTTYPE(productCode, productType) VALUES ('c2', 'cone');
INSERT INTO PRODUCTTYPE(productCode, productType) VALUES ('d2', 'dish');
INSERT INTO PRODUCTTYPE(productCode, productType) VALUES ('sl2', 'slush');
INSERT INTO PRODUCTTYPE(productCode, productType) VALUES ('s1', 'sundae');
INSERT INTO PRODUCTTYPE(productCode, productType) VALUES ('ss', 'sundae');
INSERT INTO PRODUCTTYPE(productCode, productType) VALUES ('ts', 'sundae');
INSERT INTO PRODUCTTYPE(productCode, productType) VALUES ('wc', 'cone');

