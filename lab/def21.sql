SET SERVEROUTPUT ON

DECLARE
    v_num1   NUMBER := &enter_first_number;
    v_num2   NUMBER := &enter_second_number;
    v_result NUMBER;
BEGIN
    v_result := v_num1 / v_num2;
    DBMS_OUTPUT.PUT_LINE('Result: ' || v_result);

EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Error: Division by zero is not allowed.');
END;
/