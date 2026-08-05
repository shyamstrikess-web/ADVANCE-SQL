--Write a PL/SQL block to calculate the square and cube of the given number


set serveroutput on
declare
num number:=&num;
square number;
cube number;
begin
square:=num*num;
cube:=num*num*num;

dbms_output.put_line('the given number is:'||num);
dbms_output.put_line('square of:'||num||'is:'||square);
dbms_output.put_line('cude of:'||num||'is:'||cube);

end;
/
