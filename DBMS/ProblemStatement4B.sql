create table Borrower_AP22(roll_no integer,name varchar(10),DOI DATE,book_name varchar(10),status varchar(10)); 
 
 insert into Borrower_AP22 values(12,'patel',DATE '2018-07-01','xyz','issued');
 insert into Borrower_AP22 values(14,'shinde',DATE '2018-06-01','oop','issued');
 insert into Borrower_AP22 values(16,'bhangale',DATE '2018-05-01','coa','returned');
 insert into Borrower_AP22 values(18,'rebello',DATE '2018-06-15','toc','returned');
 insert into Borrower_AP22 values(20,'patil',DATE '2018-05-15','mp','issued');

 
 select * from Borrower_AP22;
 
create table Fine_B18(roll_no int,fine_date DATE,amount int); 
insert into Fine_B18 values(12,DATE '2018-07-28',135); 
select * from Fine_B18;

set serveroutput on;
create procedure p_32(roll_new in int,book_name in varchar2) 
as
X NUMBER;

begin

select SYSDATE() - DOI into X 
from Borrower_AP22 
where roll_no=roll_new;
if ((X>15) and (X<30))
then
insert into Fine_B18 values(roll_new,SYSDATE(),(X*5));
end if;
if (X>30)
then
insert into Fine_B18 values(roll_new,SYSDATE(),(X*50));
end if;
update Borrower_AP22 set status='returned' where
roll_no=roll_new;
end;
 /
 
begin
p_32(14,'oop');
end;
/

begin
p_32(20,'patil');
end;
/
