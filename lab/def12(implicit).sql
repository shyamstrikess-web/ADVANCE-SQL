DECLARE
   
BEGIN

    UPDATE emp 
    SET salary = salary * 1.05 
    WHERE dept = 10;


    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employees found in Department 20. No updates made.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' employee(s) updated successfully.');
        
       
        INSERT INTO emp_update (empno, old_sal, new_sal, update_date)
        SELECT emp_num, salary / 1.05,salary, SYSDATE 
        FROM emp 
        WHERE dept = 10;
    END IF;

  
    IF SQL%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Implicit cursor is still open.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Implicit cursor is closed automatically by Oracle.');
    END IF;

    COMMIT;
END;
/
