--Write a PL/SQL block that explains the use of the ZERO_DIVIDE exception. 

set serveroutput on
declare
    n1 number:=&n1;
    n2 number:=&n2;
    d number;
begin
    dbms_output.put_line('Enter Number 1: '||n1);
    dbms_output.put_line('Enter Number 2: '||n2);
    d:=n1/n2;
    dbms_output.put_line('Divided Result: '||d);
    Exception
    when zero_divide then
    dbms_output.put_line('You are trying to divide by Zero');
end;
/