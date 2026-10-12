--Write a trigger to restrict users from using the table on Sunday.

CREATE OR REPLACE TRIGGER trg_restrict_sunday
BEFORE INSERT OR UPDATE OR DELETE ON EMP
BEGIN
    IF TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH') = 'SUN' THEN
        RAISE_APPLICATION_ERROR(-20001, 'Table access is restricted on Sundays.');
    END IF;
END;
/
