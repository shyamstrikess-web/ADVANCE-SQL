--Write a trigger that restricts the entry of record if salary is greater than Rs.50000. 

CREATE OR REPLACE TRIGGER trg_check_salary_limit
BEFORE INSERT OR UPDATE ON EMP
FOR EACH ROW
BEGIN
    IF :NEW.SALARY > 50000 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Salary cannot be greater than Rs. 50,000.');
    END IF;
END;
/
