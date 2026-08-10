--  Write a PL/SQL block that uses a cursor attribute SQL%ROWCOUNT to raise the basic salary of employees by 10% that are working in department number 10 and also display the appropriate message based on the existence of the record in the EMP table. (Use Implicit Cursor)

SET SERVEROUTPUT ON

DECLARE

    v_rows_updated NUMBER;

BEGIN

    UPDATE emp
    SET salary = salary * 1.10
    WHERE dept = 5;

    v_rows_updated := SQL%ROWCOUNT;

    IF SQL%FOUND THEN

        DBMS_OUTPUT.PUT_LINE('Salary successfully increased by 10% for ' || v_rows_updated || ' employee(s) in Department 10.');

    ELSE

        DBMS_OUTPUT.PUT_LINE('No employee records found for Department 10.');

    END IF;

    COMMIT;

END;
/