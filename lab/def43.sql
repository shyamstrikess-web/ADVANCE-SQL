--Write a trigger to insert the values into the NEWEMP table when the records are inserted into the EMP table. 
CREATE OR REPLACE TRIGGER trg_copy_to_newemp
AFTER INSERT ON EMP
FOR EACH ROW
BEGIN
    INSERT INTO NEWEMP (EMP_ID, EMP_NAME, DEPT, SALARY)
    VALUES (:NEW.EMP_ID, :NEW.EMP_NAME, :NEW.DEPT, :NEW.SALARY);
END;
/