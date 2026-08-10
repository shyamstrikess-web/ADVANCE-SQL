DECLARE
   
BEGIN
    -- 1. Execute the update (this automatically opens the implicit SQL cursor)
    UPDATE emp 
    SET salary = salary * 1.05 
    WHERE dept = 10;

    -- 2. Use SQL%NOTFOUND to check if any rows were updated
    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employees found in Department 20. No updates made.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' employee(s) updated successfully.');
        
        -- Note: For implicit cursors, to insert into the tracking table row-by-row,
        -- it is best practice to use a Database Trigger on the EMP table. 
        -- Alternatively, you can use a basic INSERT with a subquery here:
        INSERT INTO emp_update (empno, old_sal, new_sal, update_date)
        SELECT emp_num, salary / 1.05,salary, SYSDATE 
        FROM emp 
        WHERE dept = 10;
    END IF;

    -- 3. Use SQL%ISOPEN (Will always be FALSE for implicit cursors)
    IF SQL%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Implicit cursor is still open.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Implicit cursor is closed automatically by Oracle.');
    END IF;

    COMMIT;
END;
/