SET SERVEROUTPUT ON;

DECLARE
    v_dividend  NUMBER := 50;
    v_divisor   NUMBER := 0;
    v_result    NUMBER;
    
    -- Variables to store the trapped error details
    v_error_code NUMBER;
    v_error_msg  VARCHAR2(255);

BEGIN
    DBMS_OUTPUT.PUT_LINE('Attempting calculation...');
    
    -- This operation will trigger an ORA-01476 (divisor is equal to zero) exception
    v_result := v_dividend / v_divisor;
    
    DBMS_OUTPUT.PUT_LINE('Result is: ' || v_result);

EXCEPTION
    WHEN OTHERS THEN
        -- Trap the exact error number and message using the built-in functions
        v_error_code := SQLCODE;
        v_error_msg  := SQLERRM;
        
        DBMS_OUTPUT.PUT_LINE('----------------------------------------');
        DBMS_OUTPUT.PUT_LINE('AN ERROR OCCURRED!');
        DBMS_OUTPUT.PUT_LINE('SQLCODE : ' || v_error_code);
        DBMS_OUTPUT.PUT_LINE('SQLERRM : ' || v_error_msg);
        DBMS_OUTPUT.PUT_LINE('----------------------------------------');
        
        -- Real-world usage usually involves inserting these values into an error_log table:
        -- INSERT INTO error_log (err_code, err_message, err_date) 
        -- VALUES (v_error_code, v_error_msg, SYSDATE);
END;
/