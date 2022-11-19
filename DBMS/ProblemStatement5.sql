CREATE TABLE Customers (
	customer_id INT,
	first_name VARCHAR(10)
);
CREATE TABLE Orders (
	order_id INT,
	amount INT,
	customer_id INT
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

-- NATURAL INNER JOIN

SELECT Customers.customer_id, first_name, order_id, amount 
	FROM Customers
    INNER JOIN Orders 
    ON Customers.customer_id = Orders.customer_id; 

-- RIGHT JOIN / RIGHT OUTER JOIN

SELECT Customers.customer_id, order_id, amount, first_name 
	FROM Customers 
    RIGHT JOIN Orders 
    ON Customers.customer_id = Orders.customer_id;  

-- LEFT JOIN / LEFT OUTER JOIN

SELECT Customers.customer_id, order_id, amount, first_name 
	FROM Customers 
    LEFT JOIN Orders 
    ON Customers.customer_id = Orders.customer_id;  

-- OUTER JOIN / FULL OUTER JOIN

SELECT Customers.customer_id, order_id, amount, first_name 
	FROM Customers 
    OUTER JOIN Orders 
    ON Customers.customer_id = Orders.customer_id;  
