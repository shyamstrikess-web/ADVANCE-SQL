--   Write a PL/SQL block which converts temperature from Celsius to Fahrenheit.

SET SERVEROUTPUT ON;

DECLARE

    celsius    NUMBER := &Enter_Celsius;
    fahrenheit NUMBER;

BEGIN

    fahrenheit := (celsius * 9 / 5) + 32;

    DBMS_OUTPUT.PUT_LINE(celsius || '°C is equal to ' || fahrenheit || '°F');

END;
/