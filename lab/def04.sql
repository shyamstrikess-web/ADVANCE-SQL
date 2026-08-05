--  Write a PL/SQL block which accepts measurement in feet and displays it in cm, inch and meter.

SET SERVEROUTPUT ON;

DECLARE

    feet NUMBER := &Enter_Feet;
    inch NUMBER;
    cm   NUMBER;
    m    NUMBER;

BEGIN

    inch := feet * 12;
    cm   := inch * 2.54;
    m    := cm / 100;

    DBMS_OUTPUT.PUT_LINE('--- CONVERSION RESULTS ---');
    DBMS_OUTPUT.PUT_LINE('Feet:        ' || feet || ' ft');
    DBMS_OUTPUT.PUT_LINE('Inches:      ' || ROUND(inch, 2) || ' in');
    DBMS_OUTPUT.PUT_LINE('Centimeters: ' || ROUND(cm, 2) || ' cm');
    DBMS_OUTPUT.PUT_LINE('Meters:      ' || ROUND(m, 2) || ' m');
END;
/