--Write a program using a cursor to insert the records of employees in the EMP_BACKUP table for given DEPT_NO, also raise a user-defined exception NO_DEPT_FOUND when no records are found for entered DEPT_NO.
DECLARE
    CURSOR C1 IS
        SELECT * FROM EMP WHERE DEPTNO = &DEPT_NO;

    NO_DEPT_FOUND EXCEPTION;
    V_COUNT NUMBER := 0;

BEGIN
    FOR E IN C1 LOOP
        INSERT INTO EMP_BACKUP VALUES E;
        V_COUNT := V_COUNT + 1;
    END LOOP;

    IF V_COUNT = 0 THEN
        RAISE NO_DEPT_FOUND;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Records inserted successfully');

EXCEPTION
    WHEN NO_DEPT_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No department found');
END;
/