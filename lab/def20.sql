--perform an update operation on the EMPLOYEE table using an implicit cursor
set serveroutput on;
declare 
    n number;
begin
    update emmp set basicsal = basicsal + 5000 where  EMP_N= 1;
if sql%FOUND 
then
    n := sql%ROWCOUNT;
    dbms_output.put_line(n ||' Record Updated');
end if;
end;
/