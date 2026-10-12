--Write a trigger to insert the existing values of the EMP table into NEWEMP table when the record is updated in EMP table. 

CREATE OR REPLACE TRIGGER trg_backup_old_emp
BEFORE UPDATE ON EMP
FOR EACH ROW
BEGIN
    INSERT INTO NEWEMP (EMP_ID, EMP_NAME, DEPT, SALARY)
    VALUES (:OLD.EMP_ID, :OLD.EMP_NAME, :OLD.DEPT, :OLD.SALARY);
END;
/