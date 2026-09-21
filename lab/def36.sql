--Write a simple procedure without any parameter that updates the values in the EMP table. 
CREATE OR REPLACE PROCEDURE update_emp_sal IS
BEGIN
    UPDATE emp
    SET salary = salary + 1000;

    COMMIT;
END update_emp_sal;
/
