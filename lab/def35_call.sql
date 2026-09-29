set serveroutput on;

declare
    xactno number := &actno;
    xbalance number;
begin
    xbalance := fun_balance(xactno);
    dbms_output.put_line('balance: ' || xbalance);
end;
/