SET SERVEROUTPUT ON;

DECLARE
    v_dividend  NUMBER := 50;
    v_divisor   NUMBER := 0;
    v_result    NUMBER;
    
  
    v_error_code NUMBER;
    v_error_msg  VARCHAR2(255);

BEGIN
    DBMS_OUTPUT.PUT_LINE('Attempting calculation...');
    
    
    v_result := v_dividend / v_divisor;
    
    DBMS_OUTPUT.PUT_LINE('Result is: ' || v_result);

EXCEPTION
    WHEN OTHERS THEN
      
        v_error_code := SQLCODE;
        v_error_msg  := SQLERRM;
        
        DBMS_OUTPUT.PUT_LINE('----------------------------------------');
        DBMS_OUTPUT.PUT_LINE('AN ERROR OCCURRED!');
        DBMS_OUTPUT.PUT_LINE('SQLCODE : ' || v_error_code);
        DBMS_OUTPUT.PUT_LINE('SQLERRM : ' || v_error_msg);
        DBMS_OUTPUT.PUT_LINE('----------------------------------------');
        
    
END;
/
