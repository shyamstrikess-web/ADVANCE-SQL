-- Write a simple procedure that increases the basic salary of employees for the given department number by percentage inputted by the user using the IN parameter. 
CREATE OR REPLACE PROCEDURE incr_sal(
    xdeptno IN NUMBER,
    per     IN NUMBER
) IS
BEGIN
    UPDATE emp 
    SET salary = salary + (salary * (per / 100)) 
    WHERE dept = xdeptno;

    COMMIT;
END incr_sal;
/
