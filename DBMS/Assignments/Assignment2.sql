-- CREATE DATABASE

CREATE TABLE StudentDB (
    student_ID VARCHAR(10) PRIMARY KEY,
    student_name VARCHAR(50),
    department_name VARCHAR(10),
    total_credits INT
);

INSERT INTO StudentDB VALUES("201", "Jack", "COMP", 22);
INSERT INTO StudentDB VALUES("202", "Jill", "COMP", 21);
INSERT INTO StudentDB VALUES("203", "James", "COMP", 20);
INSERT INTO StudentDB VALUES("204", "Jordan", "COMP", 21);
INSERT INTO StudentDB VALUES("205", "Jessy", "COMP", 19);


CREATE TABLE TakesDB (
    student_ID VARCHAR(10) PRIMARY KEY, 
    course_ID VARCHAR(10),
    semester INT,
    academic_year INT,
    grade VARCHAR(1),
    section_ID VARCHAR(10)
);

INSERT INTO TakesDB VALUES("201", "C0001", 3, 2022, "A", "SACO");
INSERT INTO TakesDB VALUES("202", "C0001", 5, 2022, "A", "TACO");
INSERT INTO TakesDB VALUES("203", "C0001", 3, 2022, "B", "SBCO");
INSERT INTO TakesDB VALUES("204", "C0001", 3, 2022, "B", "SBCO");
INSERT INTO TakesDB VALUES("205", "C0001", 5, 2022, "A", "TACO");

CREATE TABLE FacultyDB (
    faculty_ID VARCHAR(10) PRIMARY KEY,
    faculty_name VARCHAR(10),
    department_name VARCHAR(10),
    salary INT
);

INSERT INTO FacultyDB VALUES("FCO001", "Tyler", "COMP", 50000);
INSERT INTO FacultyDB VALUES("FCO002", "Taylor", "COMP", 60000);
INSERT INTO FacultyDB VALUES("FCO003", "Thiago", "COMP", 45000);

CREATE TABLE TeachesDB (
    faculty_ID VARCHAR(10) PRIMARY KEY, 
    course_ID VARCHAR(10),
    section_ID VARCHAR(10),
    semester INT,
    academic_year INT
);

INSERT INTO TeachesDB VALUES("FCO001", "SUBCOMP001", "A", 3, 2022);
INSERT INTO TeachesDB VALUES("FCO002", "SUBCOMP002", "B", 3, 2022);
INSERT INTO TeachesDB VALUES("FCO003", "SUBCOMP003", "A", 5, 2022);

CREATE TABLE SectionDB (
    section_ID VARCHAR(10) PRIMARY KEY,
    course_ID VARCHAR(10),
    building_name VARCHAR(1) ,
    room_number INT,
    semester INT,
    academic_year INT
);

INSERT INTO SectionDB VALUES("SACO", "C0001", "A Building", 14, 3, 2022);
INSERT INTO SectionDB VALUES("SBCO", "C0001", "A Building", 15, 3, 2022);
INSERT INTO SectionDB VALUES("TACO", "C0001", "B Building", 32, 5, 2022);

CREATE TABLE CourseDB (
    course_ID VARCHAR(10),
    course_name VARCHAR(20),
    department_name VARCHAR(10),
    credits INT
);

INSERT INTO CourseDB VALUES("C0001", "COMPUTER SCIENCE", "COMP", 22);


-- RUNNING QUERIES

SELECT * 
	FROM FacultyDB 
    INNER JOIN TeachesDB
    ON TeachesDB.faculty_ID = FacultyDB.faculty_ID;
    
SELECT * 
	FROM FacultyDB 
    INNER JOIN TeachesDB
    ON TeachesDB.faculty_ID = FacultyDB.faculty_ID;

SELECT * 
	FROM FacultyDB 
    NATURAL JOIN TeachesDB;
