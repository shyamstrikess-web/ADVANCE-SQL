--w.a.p that accept principle amount,rate of int.. and no of year and find simple int.
set serveroutput on
declare
price number:=&price;
rate number:=&rate;
year number:=&year;
interest number;
begin
interest:=price*rate*year/100;
dbms_output.put_line('simple interest for item is'||price||