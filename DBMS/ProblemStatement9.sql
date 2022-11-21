CREATE TABLE library( 
    B_id NUMBER, 
    Bname varchar2(20), 
    B_author varchar2(20)
);

INSERT INTO library VALUES(100, 'Math3', 'Dev');
INSERT INTO library VALUES(103, 'Hindi', 'Manik');
INSERT INTO library VALUES(102, 'Malyalam','Selvam');
INSERT INTO library VALUES(112, 'Marathi','R Vaidya');

CREATE TABLE library_audit(
    B_id number,
    Bname varchar2(20),
    B_author varchar2(20)
);

CREATE TRIGGER trig1 
BEFORE
UPDATE OR DELETE
ON library 
for each row 
enable 
BEGIN
    INSERT INTO library_audit VALUES( 
        :old.B_id, 
        :old.Bname, 
        :old.B_author 
    ); 
END; 
/

SELECT * FROM library;
delete FROM library WHERE B_id=100;
UPDATE library set B_id=105 WHERE Bname='Hindi';
SELECT * FROM library;
SELECT * FROM library_audit;
