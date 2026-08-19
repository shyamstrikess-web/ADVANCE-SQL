--Write a PL/SQL block to accept a student name from a user if it exists, display his/her result from the RESULT table otherwise display appropriate message using exception handling. 
SET SERVEROUTPUT ON;

DECLARE
    v_name       VARCHAR2(50) := '&Enter_Student_Name';
    
    v_rlno       NUMBER;
    v_out_name   VARCHAR2(50);
    v_m1         NUMBER;
    v_m2         NUMBER;
    v_m3         NUMBER;
    v_m4         NUMBER;
    v_m5         NUMBER;
    v_total      NUMBER;
    v_percentage NUMBER;
    v_result     VARCHAR2(10);
BEGIN
    -- 'RESULT' is the exact column name in your table
    SELECT RLNO, NAME, M1, M2, M3, M4, M5, TOTAL, PERCENTAGE, RESULT
    INTO v_rlno, v_out_name, v_m1, v_m2, v_m3, v_m4, v_m5, v_total, v_percentage, v_result
    FROM mid1
    WHERE UPPER(TRIM(NAME)) = UPPER(TRIM(v_name));

    DBMS_OUTPUT.PUT_LINE('----------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Roll No    : ' || v_rlno);
    DBMS_OUTPUT.PUT_LINE('Name       : ' || v_out_name);
    DBMS_OUTPUT.PUT_LINE('Marks      : ' || v_m1 || ', ' || v_m2 || ', ' || v_m3 || ', ' || v_m4 || ', ' || v_m5);
    DBMS_OUTPUT.PUT_LINE('Total      : ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Percentage : ' || v_percentage || '%');
    DBMS_OUTPUT.PUT_LINE('Result     : ' || v_result);
    DBMS_OUTPUT.PUT_LINE('----------------------------------------');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('----------------------------------------');
        DBMS_OUTPUT.PUT_LINE('Error: No record found for student "' || v_name || '".');
        DBMS_OUTPUT.PUT_LINE('----------------------------------------');
        
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('----------------------------------------');
        DBMS_OUTPUT.PUT_LINE('Error: Multiple students found with name "' || v_name || '". Search using Roll No (RLNO) instead.');
        DBMS_OUTPUT.PUT_LINE('----------------------------------------');
        
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/