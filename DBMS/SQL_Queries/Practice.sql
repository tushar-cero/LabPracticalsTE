-- Dropping a Table

DROP TABLE Customers;
DROP TABLE Orders;
DROP TABLE Shippings;

-- Creating Table

CREATE TABLE employee_master (
  emp_id INT, 
  first_name VARCHAR(20),
  middle_name VARCHAR(20),
  last_name VARCHAR(20),
  department VARCHAR(10),
  manager_id INT
);

CREATE TABLE branch_master (
  branch_id INT, 
  branch_name VARCHAR(20)
);

-- INERT VALUES

INSERT INTO employee_master VALUES (2022001, "Stuart", "Alex", "Broad", "ENG", "502001");
INSERT INTO employee_master VALUES (2022002, "James", "Steve", "Anderson", "RND", "502002");
INSERT INTO employee_master VALUES (2022003, "Steven", "Matrin", "Finn", "RND", "502002");
INSERT INTO employee_master VALUES (2022004, "Jonathan", "Henry", "Traut", "ENG", "502001");
INSERT INTO employee_master VALUES (2022005, "Tim", "Alister", "David", "ENG", "502001");

INSERT INTO branch_master VALUES (902001, "ENG");
INSERT INTO branch_master VALUES (902002, "RND");

-- SELECT BOTH TABLES

