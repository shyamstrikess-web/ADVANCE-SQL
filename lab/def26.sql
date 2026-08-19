-- 26) Write a program that explains the use of the NO_DATA_FOUND exception.

set serveroutput on 

DECLARE

   v_ename EMPLOYEE.ENAME%TYPE;

BEGIN

   SELECT ENAME INTO v_ename FROM EMPLOYEE WHERE EID = &EID;

   DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_ename);

EXCEPTION

   WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('Error: Employee ID does not exist!');

END;
/ 