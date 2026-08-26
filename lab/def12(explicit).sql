SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_emp IS 
        SELECT emp_num, salary 
        FROM emp 
        WHERE dept = 10 
        FOR UPDATE OF salary;
        
    v_emp_num emp.emp_num%TYPE;
    v_old_sal emp.salary%TYPE;
BEGIN
    
    IF NOT c_emp%ISOPEN THEN
        OPEN c_emp;
        DBMS_OUTPUT.PUT_LINE('Explicit cursor opened successfully.');
    END IF;

    LOOP
        FETCH c_emp INTO v_emp_num, v_old_sal;
        

        EXIT WHEN c_emp%NOTFOUND;

        UPDATE emp 
        SET salary = salary * 1.05 
        WHERE CURRENT OF c_emp;


        INSERT INTO emp_update (empno, old_sal, new_sal, update_date)
        VALUES (v_emp_num, v_old_sal, v_old_sal * 1.05, SYSDATE);
    END LOOP;
    IF c_emp%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No employee records found in Department 20.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(c_emp%ROWCOUNT || ' employee(s) updated successfully.');
    END IF;


    IF c_emp%ISOPEN THEN
        CLOSE c_emp;
        DBMS_OUTPUT.PUT_LINE('Explicit cursor closed.');
    END IF;
    
    COMMIT;
END;
/
