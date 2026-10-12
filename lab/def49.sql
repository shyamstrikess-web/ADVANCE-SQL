--Write a trigger that identifies the gender of the employee and according to the gender sets MR. in front of MALE employees and MS. in front of FEMALE employees.

CREATE OR REPLACE TRIGGER trg_set_prefix
BEFORE INSERT OR UPDATE ON EMP
FOR EACH ROW
BEGIN
    IF UPPER(:NEW.GENDER) IN ('M', 'MALE') THEN
        :NEW.EMP_NAME := 'MR. ' || :NEW.EMP_NAME;
    ELSIF UPPER(:NEW.GENDER) IN ('F', 'FEMALE') THEN
        :NEW.EMP_NAME := 'MS. ' || :NEW.EMP_NAME;
    END IF;
END;
/