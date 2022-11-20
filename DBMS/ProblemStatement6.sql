 CREATE TABLE BorrowerDB(
   	roll_no INTEGER,
    name VARCHAR(10),
    DOI DATE,
    book_name VARCHAR(10),
    status VARCHAR(10)
); 
CREATE TABLE FineDB(
    roll_no INT,
    fine_date DATE,
    amount INT
); 
 
INSERT INTO BorrowerDB VALUES(12,'patel', '2018-07-01','xyz','issued');
INSERT INTO BorrowerDB VALUES(14,'shinde', '2018-06-01','oop','issued');
INSERT INTO BorrowerDB VALUES(16,'bhangale', '2018-05-01','coa','returned');
INSERT INTO BorrowerDB VALUES(18,'rebello', '2018-06-15','toc','returned');
INSERT INTO BorrowerDB VALUES(20,'patil', '2018-05-15','mp','issued');

INSERT INTO FineDB VALUES(12, '2018-07-28',135);  

SELECT * FROM BorrowerDB;
SELECT * FROM FineDB;
