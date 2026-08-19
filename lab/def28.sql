-- 28) Write a program that explains the use of the ZERO_DIVIDE exception. 

set serveroutput on 

DECLARE

   a NUMBER := &Num1;
   b NUMBER := &Num2;
   c NUMBER;

BEGIN

   c := a / b;
   DBMS_OUTPUT.PUT_LINE('Result: ' || c);

EXCEPTION

   WHEN ZERO_DIVIDE THEN
      DBMS_OUTPUT.PUT_LINE('Cannot divide by zero!');

END;
/