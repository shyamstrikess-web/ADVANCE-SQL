--Write a PL/SQL block to accept employee name from a user if it exists, display his/her basic salary otherwise display appropriate message using exception handling. 

set serveroutput on
declare
    en char(50);
    sal number(8,2);
    id number:=&id;
begin

    select ename,basicsal INTO en,sal from employee where eid=id;
    dbms_output.put_line('Employee Name: '||en||'Basic Salary '||sal);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    dbms_output.put_line('Employee '||en||' not available in table');
end;
/