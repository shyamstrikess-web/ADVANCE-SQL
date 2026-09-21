-- Write a simple procedure that increases the salary of employees for the given department not by percentage inputted by the user using the IN parameter. 
CREATE OR REPLACE PROCEDURE incr_sal_amount (
    xdeptno IN NUMBER,
    xamount IN NUMBER
) IS
BEGIN
    UPDATE emp
    SET salary = salary + xamount
    WHERE dept = xdeptno;

    COMMIT;
END incr_sal_amount;
/
