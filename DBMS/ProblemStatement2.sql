-- ---------- Creating Table

CREATE TABLE Student (
  stud_id INT, 
  deptnm VARCHAR(4), 
  sem INT, 
  name VARCHAR(30), 
  yr INT, 
  credits INT
);

CREATE TABLE  Teacher (
  teacher_id INT, 
  teacher_name VARCHAR(30), 
  salary INT, 
  deptnm VARCHAR(4)
);

-- ---------- 1. Inserting values into table

INSERT INTO Student VALUES (22001, 'COMP', 7, 'Virat Kohli', 2022, 21);
INSERT INTO Student VALUES (22002, 'COMP', 5, 'Rohit Sharma', 2022, 20);
INSERT INTO Student VALUES (22003, 'COMP', 5, 'KL Rahul', 2022, 17);
INSERT INTO Student VALUES (22004, 'ECE', 7, 'Jasprit Bumrah', 2022, 21);
INSERT INTO Student VALUES (22005, 'ECE', 3, 'Bhuvneshwar Kumar', 2022, 19);

INSERT INTO Teacher VALUES (32001, 'Rahul Dravid', 4000, 'COMP');
INSERT INTO Teacher VALUES (32001, 'Sanjay Bangar', 3000, 'COMP');
INSERT INTO Teacher VALUES (32001, 'Bharat Arun', 2400, 'ECE');
INSERT INTO Teacher VALUES (32001, 'Ravi Shastri', 1600, 'ECE');

-- ---------- 2. Updating Table

UPDATE Student
	SET deptnm='IT'
  WHERE deptnm='COMP';
    
SELECT * FROM Student;

-- ---------- 3. Find the department that has highest or average salary



-- ---------- 4. Delete records whose salary is less than 2000

DELETE FROM Teacher
	WHERE salary < 2000;

SELECT * FROM Teacher;

-- ---------- 5. Display sum of salaries Department wise

SELECT deptnm, SUM(salary)
	FROM Teacher
	GROUP BY deptnm;
