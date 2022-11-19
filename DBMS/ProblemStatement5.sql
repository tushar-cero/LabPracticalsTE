CREATE TABLE Customers (
	customer_id INT,
	first_name VARCHAR(10)
);
CREATE TABLE Orders (
	order_id INT,
	amount INT,
	cusotmer_id INT
);

INSERT INTO Customers VALUES (1, 'John');
INSERT INTO Customers VALUES (2, 'Robert');
INSERT INTO Customers VALUES (3, 'David');
INSERT INTO Customers VALUES (4, 'John');
INSERT INTO Customers VALUES (5, 'Betty');

INSERT INTO Orders VALUES (1, 400, 4);
INSERT INTO Orders VALUES (2, 300, 4);
INSERT INTO Orders VALUES (3, 12000, 3);
INSERT INTO Orders VALUES (4, 400, 1);
INSERT INTO Orders VALUES (5, 250, 2);
