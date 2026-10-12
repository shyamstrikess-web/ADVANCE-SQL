--Write a procedure that search‟s whether the given employee number is present or not in the table. (Use both IN and OUT mode variables) and also Write a PL/SQL block to call the SEARCH_EMP procedure. 
CREATE OR REPLACE PROCEDURE SEARCH_EMP (
    p_empno  IN  NUMBER,
    p_status OUT VARCHAR2
) AS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM EMP
    WHERE EMPNO = p_empno;

    IF v_count > 0 THEN
        p_status := 'FOUND';
    ELSE
        p_status := 'NOT FOUND';
    END IF;
END SEARCH_EMP;
/