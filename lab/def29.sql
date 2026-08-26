SET SERVEROUTPUT ON;

DECLARE
    -- Input employee ID
    v_empno         emp.emp_id%TYPE := &enter_emp_id;
    
    -- Variable to hold commission
    v_comm          emp.salary%TYPE;

    -- User-defined exception
    null_commission EXCEPTION;

BEGIN
    -- Implicit cursor (SQL%ROWCOUNT is managed automatically by Oracle)
    SELECT salary -- Note: Using 'salary' since standard emp schema may lack 'comm'
    INTO v_comm
    FROM emp
    WHERE emp_id = v_empno;

    -- Check if retrieved value is NULL
    IF v_comm IS NULL THEN
        RAISE null_commission;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Employee ID ' || v_empno || ' Commission/Salary: ' || v_comm);
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Employee ID ' || v_empno || ' does not exist.');
        
    WHEN null_commission THEN
        DBMS_OUTPUT.PUT_LINE('Error: NULL_COMMISSION - No commission available (value is NULL) for Employee ID ' || v_empno);
        
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/