CREATE TABLE o_rollcall(roll_no INT,name VARCHAR(20),address VARCHAR(20));
CREATE TABLE n_rollcall(roll_no INT,name VARCHAR(20),address VARCHAR(20));

INSERT INTO o_rollcall VALUES('1','Hitesh','Nandura');
INSERT INTO o_rollcall VALUES('2','Piyush','MP');
INSERT INTO o_rollcall VALUES('3','Ashley','Nsk');
INSERT INTO o_rollcall VALUES('4','Kalpesh','Dhule');
INSERT INTO o_rollcall VALUES('5','Abhi','Satara');

delimiter //

CREATE PROCEDURE p3(IN r1 INT)
BEGIN
    DECLARE r2 INT;
    DECLARE exit_loop boolean;
    DECLARE c1 cursor for SELECT roll_no FROM o_rollcall WHERE roll_no>r1;
    DECLARE continue handler for not found set exit_loop=true;
    open c1;
    e_loop: loop
    fetch c1 INTO r2;
    if not exists(SELECT * FROM n_rollcall WHERE roll_no=r2) THEN
    INSERT INTO n_rollcall SELECT * FROM o_rollcall WHERE roll_no=r2;
    end if;
    if exit_loop THEN
    close c1;
    leave e_loop;
    end if;
    end loop e_loop;
END;
//

delimiter ;

CALL p3(3);
SELECT * FROM n_rollcall;

CALL p3(0);
SELECT * FROM n_rollcall;

INSERT INTO o_rollcall VALUES('6','Patil','Kolhapur');

CALL p3(4);
SELECT * FROM n_rollcall;
