-- Write a trigger to restrict users from accessing the table on weekends. 
CREATE OR REPLACE TRIGGER trg_no_weekends
BEFORE INSERT OR UPDATE OR DELETE ON EMP
BEGIN
    IF UPPER(TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH')) IN ('SAT', 'SUN') THEN
        RAISE_APPLICATION_ERROR(-20001, 'No access on weekends.');
    END IF;
END;
/