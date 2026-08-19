--Write a PL/SQL block to accept a student name from a user if it exists, display his/her result from the RESULT table otherwise display appropriate message using exception handling. 
SET SERVEROUTPUT ON;

DECLARE
   v_name   mid1.name%TYPE := '&NAME';
   v_total  mid1.total%TYPE;
   v_per    mid1.percentage%TYPE;
   v_result mid1.result%TYPE;

BEGIN
   SELECT TOTAL, PERCENTAGE, RESULT 
   INTO v_total, v_per, v_result 
   FROM mid1 
   WHERE LOWER(TRIM(NAME)) = LOWER(TRIM(v_name));

   DBMS_OUTPUT.PUT_LINE('--- Student Result ---');
   DBMS_OUTPUT.PUT_LINE('Name       : ' || v_name);
   DBMS_OUTPUT.PUT_LINE('Total Marks: ' || v_total);
   DBMS_OUTPUT.PUT_LINE('Percentage : ' || v_per || '%');
   DBMS_OUTPUT.PUT_LINE('Status     : ' || v_result);

EXCEPTION
   WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('Error: Student "' || v_name || '" does not exist.');
      
   WHEN TOO_MANY_ROWS THEN
      DBMS_OUTPUT.PUT_LINE('Error: Multiple records found for student "' || v_name || '".');

END;
/
