-- CREATING TABLES IN DB

CREATE TABLE employee73DB (
    empID INT,
    empName VARCHAR(10),
    empSalary INT,
    empDeptID INT
);

CREATE TABLE Department73DB (
    deptID INT,
    deptName VARCHAR(10)
);

-- ---------- RUNNING QUERIES

-- 1. INSERTING RECORDS IN DB

INSERT INTO Department73DB VALUES (10, 'UI UX');
INSERT INTO Department73DB VALUES (20, 'Frontend');
INSERT INTO Department73DB VALUES (30, 'Backend');
INSERT INTO Department73DB VALUES (40, 'Testing');
INSERT INTO Department73DB VALUES (50, 'DevOps');

INSERT INTO employee73DB VALUES (5001, 'Alex', 20000, 10);
INSERT INTO employee73DB VALUES (5002, 'James', 10000, 20);
INSERT INTO employee73DB VALUES (5003, 'David', 10000, 20);
INSERT INTO employee73DB VALUES (5004, 'Andrew', 30000, 30);
INSERT INTO employee73DB VALUES (5005, 'Kevin', 30000, 30);
INSERT INTO employee73DB VALUES (5006, 'James', 30000, 30);
INSERT INTO employee73DB VALUES (5007, 'Ben', 20000, 10);
INSERT INTO employee73DB VALUES (5008, 'Chris', 40000, 50);
INSERT INTO employee73DB VALUES (5009, 'Stuart', 40000, 40);
INSERT INTO employee73DB VALUES (5010, 'James', 40000, 50);

-- VIEW DATABASE

SELECT * FROM employee73DB;
SELECT * FROM Department73DB;


-- 2. LIST OF EMPLOYEE BELONGING TO DEPARTMENT 30, 40, OR 10

SELECT employee73db.empname 
    FROM employee73DB
    WHERE empDeptID=30 OR empDeptID=40 OR empDeptID=10;
    
-- 3. EMPLOYEE DETAILS WHOSE SALARY IS BETWEEN 10000 and 30000

SELECT * 
    FROM employee73db 
    WHERE empSalary>=10000 AND empSalary<=30000;
 
SELECT * 
    FROM employee73db 
    WHERE empSalary BETWEEN 10000 AND 30000;
   
-- 4. List total no of employee.

SELECT COUNT(empName) AS Total_Employees FROM employee73db;

-- 5. List average sal of each deptID.

SELECT AVG(empSalary) AS Total_Salary FROM employee73db;

-- 6. List employee details in ascending order of salary.

SELECT * FROM employee73db 
	ORDER BY empSalary;
    

-- OTHERS
    
DROP TABLE employee73db;
DROP TABLE Department73DB;

SELECT employee73db.empID, employee73db.empName,employee73db.empSalary, employee73db.empDeptID, Department73db.deptName
    FROM employee73db
    NATURAL JOIN Department73DB
    WHERE department73db.deptid = employee73db.empdeptid
    ORDER BY empDeptID, empID;
