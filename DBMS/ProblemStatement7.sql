CREATE TABLE stud_marks(
    roll_no number(3), 
    name VARCHAR(20), 
    marks number(5));

CREATE TABLE result(
    roll_no number(3), 
    name VARCHAR(20), 
    class VARCHAR(20));

CREATE PROCEDURE Proc_Grade1 (roll_no number, name VARCHAR, marks number) 
AS
    class VARCHAR(20); 
BEGIN
    IF(marks<=1500 and marks>=990) 
        THEN class:='Distinction'; 
    ELSIF(marks<=989 and marks>=900) 
        THEN class:='First Class'; 
    ELSIF(marks<=899 and marks>=825) 
        THEN class:='Higher Second Class'; 
    ELSE 
        class:='Pass'; 
    END IF; 

    INSERT INTO stud_marks VALUES(roll_no, name, marks); 
    INSERT INTO result VALUES(roll_no,name, class); 

END; 
/

EXEC Proc_Grade1(101, 'Malan', 1400);
EXEC Proc_Grade1(102, 'Sameer', 980);

SELECT * FROM stud_marks;
SELECT * FROM result;
