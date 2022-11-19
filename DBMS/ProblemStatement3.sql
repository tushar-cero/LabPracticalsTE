-- 1. Create table Emp(empID) and Dept(deptID).

CREATE TABLE Emp( 
	emp_Id INT ,
	emp_Name VARCHAR(10),
	emp_Sal INT,
	emp_Dept_Id INT
);

CREATE TABLE Dept(
	dept_Id INT, 
	dept_Name VARCHAR(10)
);

-- 2. Add Not Null constraint to empName.



-- 3. Insert few Record.

INSERT INTO Emp VALUES (3001, 'Alex', 30000, 501 );
INSERT INTO Emp VALUES (3002, 'Steven', 30000, 501 );
INSERT INTO Emp VALUES (3003, 'David', 40000, 502);
INSERT INTO Emp VALUES (3004, 'Jos', 40000, 502 );
INSERT INTO Emp VALUES (3005, 'Ben', 50000, 502 );

INSERT INTO Dept VALUES (501, 'DESIGN');
INSERT INTO Dept VALUES (502, 'DEV');

-- 5. Add column deptloc varchar(10) to dept table.

ALTER TABLE Dept
	ADD deptloc VARCHAR(10);

-- 4. Add Unique to deptLoc.

