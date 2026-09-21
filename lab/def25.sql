-- Write a PL/SQL block using a cursor to insert the records of employees in the EMP_BACKUP table for a given department number, also raise a user defined exception NO_DEPT_FOUND when no records are found for entered DEPT_NO. (Use User Defined Exception) 
DECLARE
   
    v_deptno      EMP.DEPT%TYPE := &enter_dept_no;
    
  
    v_count       NUMBER := 0;

  
    e_no_dept_found EXCEPTION;

    
    CURSOR c_emp IS
        SELECT *
        FROM emp
        WHERE dept = v_deptno;

BEGIN

    FOR rec IN c_emp LOOP
        INSERT INTO emp_backup
        VALUES rec;

        v_count := v_count + 1;
    END LOOP;

   
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
