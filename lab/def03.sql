-- Write a PL/SQL block to accept product name, qty and price from user and then calculate discount in Rs. based on the given (%).

SET SERVEROUTPUT ON

DECLARE

    v_prod   VARCHAR2(50) := '&Product';
    v_qty    NUMBER       := &Quantity;
    v_price  NUMBER       := &Price;
    v_disc   NUMBER       := &Discount_Percent;
    v_total  NUMBER;
    v_save   NUMBER;
BEGIN
    v_total := v_qty * v_price;
    v_save  := v_total * (v_disc / 100);

    DBMS_OUTPUT.PUT_LINE('Product: ' || v_prod);
    DBMS_OUTPUT.PUT_LINE('Total Amount: Rs. ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Discount:     Rs. ' || v_save);
    DBMS_OUTPUT.PUT_LINE('Net Payable:  Rs. ' || (v_total - v_save));
END;
/