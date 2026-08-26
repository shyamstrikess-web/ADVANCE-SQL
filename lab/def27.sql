SET SERVEROUTPUT ON;

DECLARE
  
    v_bonus_input VARCHAR2(20) := '1000O'; 
    v_emp_id      EMP.EMP_ID%TYPE := 1;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Attempting to apply bonus of: ' || v_bonus_input);


    UPDATE emp
    SET salary = salary + v_bonus_input
    WHERE emp_id = v_emp_id;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Salary updated successfully.');

EXCEPTION
  
    WHEN INVALID_NUMBER THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('--------------------------------------------------');
        DBMS_OUTPUT.PUT_LINE('ERROR: INVALID_NUMBER exception raised (ORA-01722).');
        DBMS_OUTPUT.PUT_LINE('Cause: The bonus value "' || v_bonus_input || '" is not a valid number.');
        DBMS_OUTPUT.PUT_LINE('Action: Please provide digits only.');
        DBMS_OUTPUT.PUT_LINE('--------------------------------------------------');
        
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END;
/
