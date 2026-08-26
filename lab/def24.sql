--Write a PL/SQL block to display the salary of that employee whose age is 50 years otherwise display appropriate messages using exception handling. 
SET SERVEROUTPUT ON;

DECLARE
    v_ename    employee.ename%TYPE;
    v_sal      employee.basicsal%TYPE;
BEGIN
  
    SELECT ename, basicsal 
    INTO v_ename, v_sal 
    FROM employee 
    WHERE age = 50;

    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_ename || ' | Salary: ' || v_sal);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee with age 50 found in the database.');

    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Multiple employees found with age 50. Use a cursor to view all.');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
