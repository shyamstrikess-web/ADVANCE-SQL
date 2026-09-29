-- Write a function that returns the balance for a given account number. (Create ACCOUNT table with ACNO, CNAME, BNAME, BALANCE columns using appropriate data types)

CREATE OR REPLACE FUNCTION fun_balance (xactno IN NUMBER) RETURN NUMBER IS
    mybalance NUMBER;
BEGIN
    SELECT balance INTO mybalance FROM account WHERE ACNO = xactno;
    RETURN mybalance;
END fun_balance;
/





