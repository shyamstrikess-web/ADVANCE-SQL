--display records from the CUSTOMER table using an explicit cursor.
set serveroutput on
declare
    Cursor s1 IS select * from cust;
    c cust%ROWTYPE;
begin
    open s1;
loop
fetch s1 INTO c;
exit when s1%NOTFOUND;
    
    dbms_output.put_line('Customer ID:  ' ||c.custid|| 'Customer Name: ' || c.cust_nm || ' Product Type: ' || c.pro_type || 'Purchase ID : ' || c.pur_id );
end loop;
    close s1;
end;
/