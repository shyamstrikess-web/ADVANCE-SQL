--wap to generate

set serveroutput on
declare
i number:=1;
n number:=&input_number;
begin
--1. basic loop
dbms_output.put_line('===basic loop===');
loop
exit when i>n;
dbms_output.put_line(i);
i:=i+1;
end loop;
