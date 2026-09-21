-- Write a procedure that searches whether the given employee id is present or not in the table. If an employee is found then show its name otherwise raise appropriate error messages (Use both IN and OUT mode variables) and also write a PL/SQL block to call the procedure. 
CREATE OR REPLACE PROCEDURE search_emp(
    xempid IN NUMBER,
    enm    OUT VARCHAR2
) IS
BEGIN
    SELECT emp_name INTO enm 
    FROM emp 
    WHERE emp_id = xempid;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('ID not found');
END search_emp;
/
