SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_emp IS
        SELECT emp_id, emp_name, dept, salary
        FROM emp
        WHERE dept = 1; -- Replace 1 with your actual HR department number
BEGIN
    DBMS_OUTPUT.PUT_LINE(RPAD('ID', 8) || RPAD('NAME', 15) || RPAD('DEPT', 10) || 'SALARY');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------');

    FOR r IN c_emp LOOP
        DBMS_OUTPUT.PUT_LINE(
            RPAD(r.emp_id, 8) || 
            RPAD(r.emp_name, 15) || 
            RPAD(r.dept, 10) || 
            r.salary
        );
    END LOOP;
END;
/
