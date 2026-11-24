-- w.a.p that accept principal amount, rate of interest, and no of years and find simple interest
SET SERVEROUTPUT ON;

DECLARE
    v_price    NUMBER := &price;
    v_rate     NUMBER := &rate;
    v_year     NUMBER := &year;
    v_interest NUMBER;
BEGIN
    v_interest := (v_price * v_rate * v_year) / 100;

    DBMS_OUTPUT.PUT_LINE('Simple interest for principal ' || v_price || ' is: ' || v_interest);
END;
/
