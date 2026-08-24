DECLARE
    -- Input department number matching EMP.DEPT data type
    v_deptno      EMP.DEPT%TYPE := &enter_dept_no;
    
    -- Counter to track fetched rows
    v_count       NUMBER := 0;

    -- User-defined exception
    e_no_dept_found EXCEPTION;

    -- Cursor to select matching records
    CURSOR c_emp IS
        SELECT *
        FROM emp
        WHERE dept = v_deptno;

BEGIN
    -- Fetch records using implicit cursor loop
    FOR rec IN c_emp LOOP
        INSERT INTO emp_backup
        VALUES rec;

        v_count := v_count + 1;
    END LOOP;

    -- Raise exception if no matching department was found
    IF v_count = 0 THEN
        RAISE e_no_dept_found;
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(v_count || ' record(s) successfully backed up for Department ' || v_deptno);
    END IF;

EXCEPTION
    WHEN e_no_dept_found THEN
        DBMS_OUTPUT.PUT_LINE('Error: NO_DEPT_FOUND - No records found for Department Number ' || v_deptno);
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/